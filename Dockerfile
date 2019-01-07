FROM arm32v6/alpine:latest
LABEL maintainer="Dan Milon <i@danmilon.me>"
COPY qemu-arm-static /usr/bin

RUN \
  mkdir /build && \
  apk add \
    --no-cache \
    gcc \
    musl-dev \
    python3-dev \
    python3 && \
  wget https://github.com/mutability/mlat-client/archive/v0.2.10.tar.gz -O - \
    | tar -xzC /build/ && \
  pip3 \
    install \
    /build/mlat-client-0.2.10 && \
  apk del \
    --no-cache \
    --rdepends \
    gcc \
    musl-dev \
    python3-dev && \
  rm -rf \
    /build \
    ~/.cache/pip \
    /usr/bin/qemu-arm-static
