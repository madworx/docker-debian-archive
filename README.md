[![Build Status](https://travis-ci.org/madworx/docker-debian-archive.svg?branch=master)](https://travis-ci.org/madworx/docker-debian-archive)

# Docker images for old (archived) Debian releases

Currently, the following images are available and automatically built:

* Debian 4 [Etch](https://www.debian.org/releases/etch/) (~2007)
* Debian 5 [Lenny](https://www.debian.org/releases/lenny/) (~2009)
* Debian 6 [Squeeze](https://www.debian.org/releases/squeeze/) (~2011)

Later releases are readily available for the [official Debian repo at Docker Hub](https://hub.docker.com/_/debian/).

## Usage

```
mad@maddev:~$ docker run --rm -it madworx/debian-archive:etch
sh-3.1# cat /etc/debian_version
4.0
```

## Source

Everything is hosted on [github](https://github.com/madworx/docker-debian-archive).
