FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y \
    g++ \
    make \
    cmake \
    libbz2-dev \
    zlib1g-dev \
    ragel \
    wget \
    && mkdir -p /tools/vcf_validator 

RUN cd /tools/vcf_validator \
    && wget https://github.com/EBIvariation/vcf-validator/releases/download/v0.8/vcf_validator_linux \
    && chmod 750 vcf_validator_linux 

ENV PATH $PATH:/tools/vcf_validator

