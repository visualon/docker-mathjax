# syntax=docker/dockerfile:1@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e

# renovate: datasource=github-releases depName=mathjax lookupName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM bitnami/nginx:1.26.0-debian-12-r0@sha256:b7b2f4e682bae6a28e637ccb901521cc84005e30d6874224dc6b44f87614902b

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
