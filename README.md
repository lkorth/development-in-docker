Development in Docker
=====================

## Why

Provide an ephemeral environment to install development packages, test things out and avoid mucking
up your host machine with every new language version or language manager.

## Building

If you've changed the `Dockerfile` or don't have an existing instance of the image, run `./build.sh`
to build the latest instance of the docker image.

## Running

Run `./start.sh` to start a docker container. If you pass a path as the first argument to `start.sh`,
that path will be mounted in `/home/docker/dev`, otherwise the current directory will be mounted to `/home/docker/dev`.
