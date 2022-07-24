#!/bin/bash

cache_dir="/tmp/cache-apt-pkgs-action-cache"
rm -fr ${cache_dir}; mkdir ${cache_dir}

sudo apt-get autoremove --yes xdot rolldice
time ../cache-apt-pkgs-action/install_and_cache_pkgs.sh ${cache_dir} xdot rolldice
