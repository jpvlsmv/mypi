FROM debian:stable
ARG TAG_VERSION

RUN apt-get update && apt-get install -y \
	build-essential \
	curl \
	libfdt-dev \
	libglib2.0-dev \
	libpixman-1-dev \
	pkg-config \
	python-minimal \
	zlib1g-dev \
    && apt-get clean

# Running as unprivileged user from here on
RUN useradd -m build
USER build
WORKDIR /home/build/

