#!/bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get --yes install libboost-dev
dpkg -L libboost1.74-dev
