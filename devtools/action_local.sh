#!/bin/bash

function usage {
  echo ${1}
  echo "usage: $(basename ${0}) [install | restore] [PACKAGE]..."
  exit ${2}
}

execute_install_scripts=true
debug=false

root_dir="/tmp/cache-apt-pkgs-action"
cache_dir="${root_dir}/cache"
restore_dir="${root_dir}/restore"
add_repositories=""

if [ "${1}" == "install" ]; then
  sudo rm -fr ${cache_dir}
  mkdir -p ${cache_dir}
  test ${restore_dir} != "/" && rm -fr ${restore_dir}
  cache_hit=false  
elif [ "${1}" == "restore" ]; then
  cache_hit=true  
else
  usage "Command not recognized." 1
fi

packages=${@:2}
[ "${packages}" ] || usage "No packages specified." 2

apt_packages=$(echo ${packages} | sed 's/:/=/g')
sudo apt-get purge --yes ${apt_packages}
sudo apt-get autoremove --yes ${apt_packages}

time ../../cache-apt-pkgs-action/post_cache_action.sh "${cache_dir}" "${restore_dir}" ${cache_hit} ${execute_install_scripts} ${debug} ${packages}
