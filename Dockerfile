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
      tmux \
      vim \
      wget \
      zsh

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN git clone https://github.com/lkorth/dotfiles.git
RUN cd /dotfiles && ./install.sh

RUN apt-get update && apt-get install -y \
     nodejs \
     openjdk-11-jdk \
     ruby \
     ruby-dev

# Ruby
RUN gem install bundler

RUN mkdir -p /home/dev
VOLUME /home/dev
WORKDIR /home/dev
