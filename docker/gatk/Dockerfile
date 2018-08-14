FROM ubuntu:16.04

RUN apt-get update -y && apt-get install -y \
    python \
    tar \
    unzip \
    wget \
    openjdk-8-jre \
    && mkdir -p /tools

ENV PATH $PATH:/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.38.amzn1.x86_64/jre/bin
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.38.amzn1.x86_64/jre

RUN cd /tools \
    && wget https://github.com/broadinstitute/gatk/releases/download/4.0.7.0/gatk-4.0.7.0.zip \
    && unzip gatk-4.0.7.0.zip \
    && rm gatk-4.0.7.0.zip

ENV PATH $PATH:/tools/gatk-4.0.7.0


