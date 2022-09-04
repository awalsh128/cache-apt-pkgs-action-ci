#!/bin/bash -x

apt-get install --download-only qemu-user-static

mkdir /tmp/qus-ctrl
dpkg -e /var/cache/apt/archives/qemu-user-static_1%3a4.2-3ubuntu6.23_amd64.deb /tmp/qus-ctrl

sh -x /tmp/qus-ctrl/postinst configure

if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
  echo "Command succeeded"
  exit 0;
else
  echo "Command failed"
  exit 1;
fi
