#!/bin/bash

set -euf -o pipefail

if ! command -v docker &> /dev/null
then
  echo "Error: docker was not found, please make sure docker is installed"
  exit
fi

docker run --network host --volume $1:/home/dev --interactive --tty development-in-docker zsh
