# syntax=docker/dockerfile:1@sha256:a57df69d0ea827fb7266491f2813635de6f17269be881f696fbfdf2d83dda33e

# renovate: datasource=github-releases depName=mathjax lookupName=mathjax/MathJax
ARG MATHJAX_VERSION=2.7.9

FROM bitnami/nginx:1.26.0-debian-12-r1@sha256:476d94e773ee511bb789fafa69b2fcf39a91549dbe1386b1f64fb8f876ac3883

ARG MATHJAX_VERSION

ADD https://github.com/mathjax/MathJax.git#${MATHJAX_VERSION} /app

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="VisualOn GmbH <code@visualon.de>" \
  org.opencontainers.image.licenses="Apache-2.0" \
  org.opencontainers.image.source="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.url="https://github.com/visualon/docker-mathjax" \
  org.opencontainers.image.version="${MATHJAX_VERSION}"
