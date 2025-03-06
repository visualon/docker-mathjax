# syntax=docker/dockerfile:1@sha256:4c68376a702446fc3c79af22de146a148bc3367e73c25a5803d453b6b3f722fb

# renovate: datasource=github-releases depName=mathjax packageName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM bitnami/nginx:1.26.2-debian-12-r10@sha256:84c926c7c58d73f7d77da593695b059a9a3d78c1b5407f1e137f97f59112b459

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
