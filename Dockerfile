# syntax=docker/dockerfile:1.21.0@sha256:27f9262d43452075f3c410287a2c43f5ef1bf7ec2bb06e8c9eeb1b8d453087bc

# renovate: datasource=github-releases depName=mathjax packageName=mathjax/MathJax
ARG MATHJAX_VERSION=4.0.0

FROM ghcr.io/visualon/nginx:1.28.2@sha256:c22f2df42626642df60177d8982a5ad55971763a33a8aae83b0b3d196486047c

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.description="Mathjax on Alpine NGINX" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
