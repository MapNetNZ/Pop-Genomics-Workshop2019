
FROM ubuntu

MAINTAINER John McCallum cfljam@users.noreply.github.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
      gcc \
      git \
      build-essential \
      libgsl-dev \
      zip unzip \
      zlib1g \
      zlib1g-dev \
      gettext \
      libgettextpo-dev \
      wget && \
      rm -rf /var/lib/apt/lists/*

ARG GIT_URL="https://github.com/LynchLab/MAPGD/archive/v0.4.26.zip"
RUN wget -O MAPGD.zip $GIT_URL  && \
  unzip MAPGD.zip && \
  cd MAPGD* && \
  ./configure && \
  make && make install
