# syntax=docker/dockerfile:1.29.0@sha256:572cebbc2b15e6f84c077742952674889cb63cd5e9b80abdffcbe587b6f19183

# renovate: datasource=github-releases depName=mathjax packageName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM ghcr.io/visualon/nginx:1.30.6@sha256:99c43fb3c34f60eeb4e2189098593624ee6414608e6baec97e495d612f7c67be

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.description="Mathjax on Alpine NGINX" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
