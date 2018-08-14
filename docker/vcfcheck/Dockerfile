FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y \
    g++ \
    make \
    cmake \
    libbz2-dev \
    liblzma-dev \
    zlib1g-dev \
    dpkg-dev \
    ragel \
    git \
    && mkdir -p /tools

RUN cd /tools \
    && git clone --recursive https://github.com/vcflib/vcflib.git \
    && cd vcflib \
    && make

ENV PATH $PATH:/tools/vcflib/bin


