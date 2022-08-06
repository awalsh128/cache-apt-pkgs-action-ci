#!/bin/bash

cache_dir="/tmp/cache-apt-pkgs-action-cache"
rm -fr ${cache_dir}; mkdir ${cache_dir}

sudo apt-get purge --yes ${@}
sudo apt-get autoremove --yes ${@}
time ../../cache-apt-pkgs-action/pre_cache_action.sh ${cache_dir} 1 ${@}
time ../../cache-apt-pkgs-action/install_and_cache_pkgs.sh ${cache_dir} ${@}