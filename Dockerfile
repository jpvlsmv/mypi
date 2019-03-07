FROM debian:stable
ARG TAG_VERSION

COPY .release /.release

RUN echo ${TAG_VERSION} | tee /.tag_version
