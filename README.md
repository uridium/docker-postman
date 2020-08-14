Docker Postman
--
[![Docker Hub](https://img.shields.io/docker/cloud/build/uridium/postman.svg)](https://hub.docker.com/r/uridium/postman/builds)
[![Latest tag](https://img.shields.io/github/v/tag/uridium/docker-postman)](https://hub.docker.com/r/uridium/postman/tags)

Postman container for API development.

[Postman](https://www.getpostman.com/)

### Requirements

* docker
* make

### Install/Usage

Simply run `make` to fire up Postman

You can also download the image from a [registry](https://hub.docker.com/r/uridium/postman/):

    make pull

or just build the image from a Dockerfile:

    make build

To [verify](https://github.com/GoogleContainerTools/container-structure-test) the content and structure of the container:

    make test
