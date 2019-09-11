[![Build Status](https://travis-ci.org/madworx/docker-debian-archive.svg?branch=master)](https://travis-ci.org/madworx/docker-debian-archive)

# Docker images for old (archived) Debian releases

Currently, the following images are [available and automatically built on Docker hub](https://hub.docker.com/r/madworx/debian-archive/):

  * Debian 4 Etch    (~2007 (Link to [debian.org](https://www.debian.org/releases/etch/)))
  * Debian 5 Lenny   (~2009 (Link to [debian.org](https://www.debian.org/releases/lenny/)))
  * Debian 6 Squeeze (~2011 (Link to [debian.org](https://www.debian.org/releases/squeeze/)))
  * Debian 7 Wheezy  (~2016 (Link to [debian.org](https://www.debian.org/releases/wheezy/)))

Later releases are readily available for the [official Debian repo at Docker Hub](https://hub.docker.com/_/debian/).

Please  be  aware of  the  fact  that  these images  represent  legacy
versions  of   said  operating  system,  and   *do*  contain  security
issues. Please  do not  use these  images for  anything else  than O/S
research, testing etc.

## Usage

```
mad@maddev:~$ docker run --rm -it madworx/debian-archive:etch
sh-3.1# cat /etc/debian_version
4.0
```

## Source

Everything is hosted on [github](https://github.com/madworx/docker-debian-archive).
