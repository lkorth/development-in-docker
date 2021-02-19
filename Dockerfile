FROM debian:stretch

RUN apt-get update && apt-get install -y \
      git \
      tmux \
      vim \
      zsh

RUN mkdir -p /home/dev
VOLUME /home/dev
WORKDIR /home/dev
