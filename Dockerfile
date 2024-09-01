# syntax=docker/dockerfile:1@sha256:fe40cf4e92cd0c467be2cfc30657a680ae2398318afd50b0c80585784c604f28

# renovate: datasource=github-releases depName=mathjax lookupName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM bitnami/nginx:1.26.2-debian-12-r4@sha256:9e4277934d9b0d7afd60848bec76bb029e361b4aca7a18008eae9358a366cdd4

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
