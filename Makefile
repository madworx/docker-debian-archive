DOCKER_NAME := madworx/debian-archive

all: build test

build:
	./build-archived-debian-image.sh $(DEBIAN_VERSION)

test:
	shellcheck -s ksh ./build-archived-debian-image.sh
	docker run $(DOCKER_NAME):$(DEBIAN_VERSION) -c 'echo `cat /etc/os-version.txt` ok'

push:
	docker push $(DOCKER_NAME):$(DEBIAN_VERSION)
