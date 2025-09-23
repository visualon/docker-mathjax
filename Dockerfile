# syntax=docker/dockerfile:1@sha256:dabfc0969b935b2080555ace70ee69a5261af8a8f1b4df97b9e7fbcf6722eddf

# renovate: datasource=github-releases depName=mathjax packageName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM ghcr.io/visualon/nginx:1.28.0@sha256:3ed460f056cd7ceea86b1669253943a9a5fbad33ab3e92d2c2b8f26d463e8099

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.description="Mathjax on Alpine NGINX" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
