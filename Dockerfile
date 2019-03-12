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

# Pre-built toolchain from ARM
# ADD --chown=build installer-cache/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 /home/build/
RUN ( curl -sS -Lo - https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2018q4/gcc-arm-none-eabi-8-2018-q4-major-linux.tar.bz2 \
	| tar -C /home/build -xf - )


# Build qemu from source
# ADD --chown=build installer-cache/qemu-2.11.0.tar.xz /home/build/
RUN ( curl -sS -Lo - https://download.qemu.org/qemu-2.11.0.tar.xz \
	| tar -C /home/build -xf - )
RUN cd /home/build/qemu-2.11.0 && ./configure --target-list=arm-softmmu,arm-linux-user --prefix=/home/build && make && make install

# Show results
RUN /home/build/bin/qemu-system-arm --version
RUN /home/build/bin/qemu-system-arm -M help

# Tag the image
COPY .release /home/build/.release
RUN echo ${TAG_VERSION} | tee /home/build/.tag_version
