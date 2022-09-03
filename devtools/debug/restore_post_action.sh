#!/bin/bash

for fmt in  alpha armeb cris hexagon hppa i386 m68k microblaze mips mipsel mipsn32 mipsn32el mips64 mips64el ppc ppc64 ppc64le riscv32 riscv64 s390x sh4 sh4eb sparc sparc32plus sparc64 x86_64 xtensa xtensaeb; do
  sudo update-binfmts --import qemu-$fmt
done

if podman run --rm -it docker.io/arm64v8/alpine:3.14 uname -m; then
  echo "Command succeeded."
  exit 0;
else
  echo "Command failed."
  exit 1;
fi
