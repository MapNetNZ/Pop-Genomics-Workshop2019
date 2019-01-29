
FROM ubuntu

MAINTAINER John McCallum cfljam@users.noreply.github.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install \
	build-essential \
	curl \
	gcc \
	git \
	libgsl-dev \
	libcurl4-openssl-dev \
	libhts2  \
	zip \
	unzip \
	libbz2-dev \
	zlib1g \
	zlib1g-dev \
	gettext \
	libgettextpo-dev \
	wget && \
      rm -rf /var/lib/apt/lists/*
#ARG HTSLIB_URL="https://github.com/samtools/htslib/releases/download/1.9/htslib-1.9.tar.bz2"
#RUN  wget $HTSLIB_URL -O htslib.tar.bz2 && \#
#	tar -xjvf htslib.tar.bz2 && \
#	cd htslib-* && \
#	./configure && \
#	make && \
#	make install

ARG MAPGD_URL="https://github.com/LynchLab/MAPGD/archive/master.zip"
RUN wget -O MAPGD.zip $MAPGD_URL  && \
  unzip MAPGD.zip && \
  cd MAPGD-* && \
  ./configure && \
  make && make install ## && make test
