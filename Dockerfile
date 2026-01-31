FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive

# Install all build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    # Build essentials
    build-essential \
    make \
    pkg-config \
    git \
    ca-certificates \
    curl \
    # Library dependencies (from Makefile PKGCONFIG_LIBS + LDLIBS)
    libaio-dev \
    libblkid-dev \
    libkeyutils-dev \
    liblz4-dev \
    libsodium-dev \
    liburcu-dev \
    libzstd-dev \
    uuid-dev \
    zlib1g-dev \
    libudev-dev \
    udev \
    # Trixie-specific
    systemd-dev \
    # For bindgen (clang for FFI generation)
    libclang-dev \
    clang \
    # Development/debug tools
    valgrind \
    gdb \
    # Documentation build
    python3 \
    python3-docutils \
    # Version extraction fallback
    jq \
    # Debian packaging
    debhelper \
    devscripts \
    dh-cargo \
    dh-dkms \
    dpkg-dev \
    fakeroot \
    libscrypt-dev \
    cargo \
    rustc \
    libstd-rust-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /src

CMD ["/bin/bash"]
