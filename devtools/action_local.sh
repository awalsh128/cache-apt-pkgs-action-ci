#!/bin/bash

function usage {
  echo ${1}
  echo "usage: $(basename ${0}) [install | restore] [PACKAGE]..."
  exit ${2}
}

execute_postinst=true

root_dir="/tmp/cache-apt-pkgs-action"
cache_dir="${root_dir}/cache"
restore_dir="${root_dir}/restore"

if [ "${1}" == "install" ]; then
  rm -fr ${cache_dir} ${restore_dir}; mkdir ${cache_dir}
  cache_hit=false  
elif [ "${1}" == "restore" ]; then
  cache_hit=true  
else
  usage "Command not recognized." 1
fi

packages=${@:2}
[ ${packages} ] || usage "No packages specified." 2

sudo apt-get purge --yes ${packages}
sudo apt-get autoremove --yes ${packages}

time ../../cache-apt-pkgs-action/post_cache_action.sh "${cache_dir}" "${restore_dir}" ${cache_hit} ${execute_postinst} ${packages}
