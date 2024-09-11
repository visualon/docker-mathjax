# syntax=docker/dockerfile:1@sha256:865e5dd094beca432e8c0a1d5e1c465db5f998dca4e439981029b3b81fb39ed5

# renovate: datasource=github-releases depName=mathjax lookupName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM bitnami/nginx:1.26.2-debian-12-r5@sha256:bb29b7d0e91956537f763fe35299c893e435c93ec9782faa6e73b6c8be31dd12

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
