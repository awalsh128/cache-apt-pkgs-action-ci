#!/bin/bash

if [[ $(basename `pwd`) -ne devtools ]]; then
  echo "Scripts must be ran from devtools or will break."
  exit 99
fi

#######################################
# Clone a repository and change directory to it.
# Arguments:
#   The directory containing repository to rebase.
#   The tag to clone from, otherwise use HEAD.
# Returns:
#   0 if directory was changed, non-zero on error.
#######################################
function rebase_local_repo_from_head {
  repo_url="https://github.com/awalsh128/cache-apt-pkgs-action"
  repo_dir="${1}"
  repo_dir_parent=$(realpath $(dirname ${repo_dir}))
  wd=$(pwd)
  [[ -d ${repo_dir} ]] && rm -fr ${repo_dir}
  cd $repo_dir_parent
  if [[ "${2}" ]]; then
    git clone -b ${2} ${repo_url}
  else
    git clone ${repo_url}
  fi
  cd ${wd}
}

#######################################
# Clone a repository and change directory to it.
# Arguments:
#   The tag to clone from, otherwise use HEAD.
# Returns:
#   0 if directory was changed, non-zero on error.
#######################################
function clone_repo_and_cd {
  rebase_local_repo_from_head "/tmp/cache-apt-pkgs-action" "${1}"
  cd /tmp/cache-apt-pkgs-action
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
  if [[ ! "${1}" ]] || [[ -z "${1}" ]]; then
    printf "error: ${2}\n${3}\n"    
    exit 1
  fi
}

#######################################
# Print out command usage.
# Arguments:
#   Name of command.
#   Parameters
# Returns:
#   Usage message.
#######################################
function usage {
  echo "usage: `basename ${1}` ${2}"
}
