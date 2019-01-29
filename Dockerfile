
## A Docker Image for MAPGD + htslib + Samtools
FROM ubuntu

MAINTAINER John McCallum cfljam@users.noreply.github.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
	build-essential \
	curl \
	gcc \
	git \
  gettext \
	libgsl-dev \
	libcurl4-openssl-dev \
	libgettextpo-dev \
  libbz2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  liblzma-dev \
  nano \
  sqlite3 \
	unzip \
	zlib1g \
	zlib1g-dev \
  zip \
	wget && \
      rm -rf /var/lib/apt/lists/*

ARG SAMTOOLS_URL="https://github.com/samtools/samtools/releases/download/1.9/samtools-1.9.tar.bz2"
RUN  wget $SAMTOOLS_URL  -O samtools.tar.bz2 && \
 tar -xjvf samtools.tar.bz2 && \
 cd samtools-* && \
 ./configure && \
	make && \
  make prefix=/usr/local/bin install &&\
  cd htslib-* && \
  ./configure && \
 	  make && \
   make install


ARG MAPGD_URL="https://github.com/LynchLab/MAPGD/archive/master.zip"
RUN wget -O MAPGD.zip $MAPGD_URL  && \
  unzip MAPGD.zip && \
  cd MAPGD-* && \
  ./configure  && \
  make && \
  make install  # && make test
