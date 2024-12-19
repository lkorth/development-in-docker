FROM debian:bookworm

# base packages
RUN apt-get update && apt-get install -y \
      awscli \
      curl \
      g++ \
      gcc \
      gdb \
      git \
      jq \
      locales \
      locales-all \
      make \
      man \
      netcat-traditional \
      pkg-config \
      procps \
      sudo \
      tmux \
      vim \
      wget \
      zsh

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# user setup
RUN useradd --create-home --shell /bin/zsh docker
RUN echo "docker:docker" | chpasswd
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker

WORKDIR /home/docker

# Java
RUN sudo apt-get update && sudo apt-get install -y \
      openjdk-17-jdk

# Ruby
RUN sudo apt-get update && sudo apt-get install -y \
      libjpeg-dev \
      libmagickwand-dev \
      libpng-dev \
      libtiff-dev \
      libwebp-dev \
      libgsl0-dev \
      ruby \
      ruby-dev
RUN sudo gem install bundler -v 2.3.27

# Python
RUN sudo apt-get update && sudo apt-get install -y \
      python3 \
      python3-pip \
      python3-venv

# Node
RUN sudo apt-get update && sudo apt-get install -y \
     nodejs \
     npm \
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm"

RUN git clone https://github.com/lkorth/dotfiles.git
RUN cd dotfiles && ./install.sh

RUN git config --global --add safe.directory /home/docker/dev

RUN mkdir -p /home/docker/dev
VOLUME /home/docker/dev
WORKDIR /home/docker/dev
