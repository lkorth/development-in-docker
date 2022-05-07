FROM debian:buster

RUN apt-get update && apt-get install -y \
      curl \
      g++ \
      gcc \
      git \
      jq \
      locales \
      locales-all \
      make \
      pkg-config \
      tmux \
      vim \
      wget \
      zsh

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN chsh -s /bin/zsh

RUN git clone https://github.com/lkorth/dotfiles.git
RUN cd /dotfiles && ./install.sh

# Java
RUN apt-get update && apt-get install -y \
      openjdk-11-jdk

# Ruby
RUN apt-get update && apt-get install -y \
      libjpeg-dev \
      libmagickwand-dev \
      libpng-dev \
      libtiff-dev \
      libwebp-dev \
      libgsl0-dev \
      ruby \
      ruby-dev
RUN gem install bundler

# Node
RUN apt-get update && apt-get install -y \
     nodejs \
     npm \
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

RUN mkdir -p /home/dev
VOLUME /home/dev
WORKDIR /home/dev
