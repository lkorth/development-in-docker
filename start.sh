#!/bin/bash

set -euf -o pipefail

if ! command -v docker &> /dev/null
then
  echo "Error: docker was not found, please make sure docker is installed"
  exit
fi

WORKING_DIR=${1:-$(pwd)}

docker run --network host --volume $WORKING_DIR:/home/dev --interactive --tty development-in-docker zsh
