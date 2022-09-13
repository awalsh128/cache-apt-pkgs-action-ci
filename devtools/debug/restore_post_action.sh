#!/bin/bash -x

update-binfmts --import qemu-arm

if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
  echo "Command succeeded"
  exit 0;
else
  echo "Command failed"
  exit 1;
fi
