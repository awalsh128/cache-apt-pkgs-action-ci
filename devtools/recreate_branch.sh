#!/bin/bash -x

source_branch="master"
target_branch="${1}"  # replaced 

repo_dir="/tmp/cache-apt-pkgs-action"
rm -fr ${repo_dir}
cd "/tmp"
git clone https://github.com/awalsh128/cache-apt-pkgs-action
cd "${repo_dir}"

while true; do
  read -p "Do you want to push the branch reset? [Y|n] " continue_push
  case ${continue_push} in
    [Yy]*) break;;
    [Nn]*) exit;;
    *) echo "Invalid option selected.";;
  esac
done

# Delete locally
git branch --delete ${target_branch}
# Delete remotely
git push origin --delete ${target_branch}
# Create branch
git checkout --branch ${target_branch}
# Push creation to remote
git push origin ${target_branch}
