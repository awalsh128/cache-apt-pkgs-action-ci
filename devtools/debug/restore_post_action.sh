#!/bin/bash

if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
  echo "Command succeeded without installations needed."
  exit 0;
fi

for pkg in binfmt-support ipxe-qemu-256k-compat-efi-roms ipxe-qemu libbrlapi0.7 libcacard0 libfdt1 libiscsi7 libpmem1 librados2 librbd1 libslirp0 libspice-server1 libusbredirparser1 libvirglrenderer1 qemu-block-extra qemu-efi-aarch64 qemu-efi-arm qemu-efi qemu-system-arm qemu-system-common qemu-system-data qemu-system-gui qemu-user-static qemu-utils sharutils; do
  sudo DEBIAN_FRONTEND=noninteractive apt-fast --yes install ${pkg}
  if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
    echo "Package ${pkg} caused command to succeed."
    exit 0;
  fi
done
echo "Command still fails after installing all dependencies."
exit 1
