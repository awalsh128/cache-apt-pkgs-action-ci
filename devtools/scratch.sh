#!/bin/bash

install_log_filepath="/tmp/cache-apt-pkgs-action-cache/install.log"

while read -r line; do
  pkg=$(echo $line | awk '{print $2}')
  pkg_noarch=$(echo $pkg | awk -F: '{print $1}')
  if [[ "$pkg" != "$pkg_noarch" ]]; then
    dpkg -L $pkg > /tmp/$pkg
    dpkg -L $pkg_noarch > /tmp/$pkg_noarch
    diff /tmp/$pkg /tmp/$pkg_noarch
    echo "diff /tmp/$pkg /tmp/$pkg_noarch"
  fi
done < <(grep "^Unpacking " ${install_log_filepath})

# regex="^Unpacking ([^ :]+)([^ ]+)? (\[[^ ]+\]\s)?\(([^ )]+)"
# while read -r line; do
#   if [[ "${line}" =~ ${regex} ]]; then
#     echo ${BASH_REMATCH[1]} ${BASH_REMATCH[4]}
#   else
#     echo ${line}
#     echo "No match found?!"
#     exit 1
#   fi
# done < <(grep "^Unpacking " ${install_log_filepath})