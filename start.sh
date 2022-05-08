#!/bin/bash

set -euf -o pipefail

if ! command -v docker &> /dev/null
then
  echo "Error: docker was not found, please make sure docker is installed"
  exit
fi

WORKING_DIR=${1:-$(pwd)}

docker run \
  --volume $WORKING_DIR:/home/dev \
  --user $(id -u):$(id -g) \
  --interactive --tty development-in-docker zsh
