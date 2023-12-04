#!/bin/bash

set -eE
set -o pipefail

export DIST=${1:-etch}
export DOCKER_NAME=${2:-madworx/debian-archive}
export DEBIAN_MIRROR=${DEBIAN_MIRROR:="http://ftp.hosteurope.de/mirror/archive.debian.org/debian/"}

# Check if rebuild is needed:
LASTMOD=$(curl -sI "${DEBIAN_MIRROR}/dists/${DIST}/main/binary-i386/Packages.gz" | \
                 sed -n 's#^last-modified: *##pi' | \
                 sed -e 's#[^a-zA-Z0-9: -]##g')

echo "Last modification of source: ${LASTMOD}"

docker pull "${DOCKER_NAME}:${DIST}" 2>/dev/null 1>&2 || true
CURRENTLAST="$(docker inspect --format='{{ index .Config.Labels "last_modified_src"}}' \
                      "${DOCKER_NAME}:${DIST}" 2>/dev/null||echo 'non-existent')"

if [ "x${CURRENTLAST}" == "x${LASTMOD}" ] ; then
    echo "Rebuild not needed - upstream has last modification ${LASTMOD}."
    exit 1
else
    #
    # We cannot build in one step, since the debootstrap process needs
    # --privilege.
    #
    docker build -t debian-archived-builder . -f - <<EOF
FROM debian:bookworm-slim
RUN apt-get update && \
    apt-get install -y debootstrap
ENTRYPOINT [ "/bin/bash", "-c" ]
EOF

    rm -f cif || true
    docker run \
           --privileged \
           --cidfile=cif \
           debian-archived-builder \
           "mkdir '/debian-${DIST}' \
           && debootstrap --no-check-gpg \
           '${DIST}' '/debian-${DIST}' \
           '${DEBIAN_MIRROR}'"

    STAGE1_ID="$(cat cif ; rm cif)"
    STAGE2_ID="$(docker commit "${STAGE1_ID}")"

    docker build \
           -t "${DOCKER_NAME}:${DIST}" \
           --label "last_modified_src=${LASTMOD}" \
           . \
           -f - <<EOF
FROM ${STAGE2_ID} AS build
FROM scratch
COPY --from=build /debian-${DIST} /
RUN echo "debian:${DIST}" > /etc/os-version.txt
ENTRYPOINT [ "/bin/sh" ]
EOF
    docker rm "${STAGE1_ID}"
fi


