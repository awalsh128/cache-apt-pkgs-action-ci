#!/bin/sh -x

mkdir /tmp/qus-ctrl
dpkg -e /var/cache/apt/archives/qemu-user-static_1%3a4.2-3ubuntu6.23_amd64.deb /tmp/qus-ctrl

sh -x /tmp/qus-ctrl configure
