#!/bin/bash

#######################################
# Clone a repository and change directory to it.
# Arguments:
#   The tag to clone from, otherwise use HEAD.
# Returns:
#   0 if directory was changed, non-zero on error.
#######################################
function clone_repo_and_cd {
  repo_url="https://github.com/awalsh128/cache-apt-pkgs-action"
  repo_dir="/tmp/cache-apt-pkgs-action"
  rm -fr ${repo_dir}
  cd "/tmp"
  if [[ "${1}" ]]; then
    git clone -b ${1} ${repo_url}
  else
    git clone ${repo_url}
  fi
  cd "${repo_dir}"  
}

#######################################
# Yes or no prompt.
# Arguments:
#   Message to display at prompt.
# Returns:
#   None
#######################################
function confirm_prompt {
  while true; do
    read -p "${1} [Y|n] " response
    case ${response} in
      [Yy]*) break;;
      [Nn]*) exit;;
      *) echo "Invalid option selected.";;
    esac
  done
}

#######################################
# Validate argument and exit if invalid.
# Arguments:
#   Argument to validate.
#   Message to display on error.
#   Help message.
# Returns:
#   None
#######################################
function validate_arg {
  if [[ ! "${1}" ]]; then
    echo "${2}"
    echo "\n${3}"
    exit 1
  fi
}