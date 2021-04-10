#!/bin/bash

set -euf -o pipefail

docker build . -t development-in-docker
