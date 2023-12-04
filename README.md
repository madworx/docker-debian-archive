[![Build Status](https://travis-ci.org/madworx/docker-debian-archive.svg?branch=master)](https://travis-ci.org/madworx/docker-debian-archive)

# Docker images for old (archived) Debian releases

Currently, the following images are [available and automatically built on Docker hub](https://hub.docker.com/r/madworx/debian-archive/):

  * Debian 4 Etch    (~2007 (Link to [debian.org](https://www.debian.org/releases/etch/)))
  * Debian 5 Lenny   (~2009 (Link to [debian.org](https://www.debian.org/releases/lenny/)))
  * Debian 6 Squeeze (~2011 (Link to [debian.org](https://www.debian.org/releases/squeeze/)))
  * Debian 7 Wheezy  (~2016 (Link to [debian.org](https://www.debian.org/releases/wheezy/)))
  * Debian 8 Jessie  (~2015 (Link to [debian.org](https://www.debian.org/releases/jessie/)))
  * Debian 9 stretch (~2017 (Link to [debian.org](https://www.debian.org/releases/stretch/)))

Later releases are readily available for the [official Debian repo at Docker Hub](https://hub.docker.com/_/debian/).

Please  be  aware of  that  Etch to Squeeze images  represent  legacy
versions  of   said  operating  system,  and   *do*  contain  security
issues. Please  do not  use these  images for  anything else  than O/S
research, testing etc.

Please  be  aware of  that  since Wheezy images, images, although legacy, 
it still has extended security support through Freexian's ExLTS service, 
on specific (mostly server oriented) packages, for more information check 
the page at [oficial Debian Extended Long Term Support wiki page](https://wiki.debian.org/LTS/Extended).

## Usage

```
mad@maddev:~$ docker run --rm -it madworx/debian-archive:etch
sh-3.1# cat /etc/debian_version
4.0
```

## Source

Everything is hosted on [github](https://github.com/madworx/docker-debian-archive).
