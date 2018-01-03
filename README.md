Docker Postman
--

Postman container for API development.

[Postman](https://www.getpostman.com/)

### Requirements

* docker-engine
* make

### Install/Usage

Run `make` to fire up application.

You can also only download an image from a [registry](https://hub.docker.com/r/uridium/postman/) if you want:

    make pull

or just build an image from a Dockerfile:

    make build
