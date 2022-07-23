FROM ghcr.io/linuxserver/baseimage-ubuntu:focal

# set version label
LABEL build_version="mbhkoay 0.0.1"
LABEL maintainer="mbhkoay"

# environment settings
ENV URL="https://kill-the-newsletter.com"
ENV EMAIL="smtp://kill-the-newsletter.com"
ENV MAILTO="mailto:kill-the-newsletter@leafac.com"
ENV DOMAINS="kill-the-newsletter.com"

RUN \
  echo "**** install build deps ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends tar curl wget
RUN \
  mkdir kill-the-newsletter && \
  cd kill-the-newsletter
RUN \
  wget https://github.com/leafac/kill-the-newsletter/releases/download/v1.0.1/kill-the-newsletter--linux--v1.0.1.tgz && \
  tar -xzf kill-the-newsletter--linux--v1.0.1.tgz

EXPOSE 2525 25 443
ENTRYPOINT ["/kill-the-newsletter"]
