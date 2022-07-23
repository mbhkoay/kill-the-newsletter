FROM ghcr.io/linuxserver/baseimage-ubuntu:focal
RUN \
 echo "**** install build deps ****" && \
 apt-get update && \
  apt-get install -y --no-install-recommends \
    tar \
    curl && \
 mkdir kill-the-newsletter && \
 cd kill-the-newsletter && \
 curl -O https://github.com/leafac/kill-the-newsletter/releases/download/v1.0.1/kill-the-newsletter--linux--v1.0.1.tgz && \
 tar -xzf kill-the-newsletter--linux--v1.0.1.tgz

EXPOSE 11000 11000
VOLUME /kill-the-newsletter
