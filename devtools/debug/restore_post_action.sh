#!/bin/bash

set -e
binfmt_update() {
  test configure = "$1" || return 0
  command -v update-binfmts >/dev/null || return 0
  # do not touch binfmts inside a container
  # should this be done by update-binfmts instead?
  if command -v systemd-detect-virt >/dev/null; then
     systemd-detect-virt --quiet --container && return 0
  fi
  grep -zqs ^container= /proc/1/environ && return 0
  for fmt in  alpha armeb cris hexagon hppa i386 m68k microblaze mips mipsel mipsn32 mipsn32el mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 s390x sh4 sh4eb sparc sparc32plus sparc64 x86_64 xtensa xtensaeb; do
    update-binfmts --import qemu-$fmt
  done
}
sudo binfmt_update "configure"

if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
  echo "Command succeeded."
  exit 0;
else
  echo "Command failed."
  exit 1;
fi
