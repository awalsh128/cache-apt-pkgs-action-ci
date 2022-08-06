#!/bin/bash -x

set -e

source_branch="master"
target_branch="${1}"  # replaced 

# Include library.
source "$(dirname -- $(realpath -- ${0}))/lib.sh"

clone_repo_and_cd
confirm_prompt "Do you want to push the branch reset?"

# Delete locally
git branch --delete ${target_branch}
# Delete remotely
git push origin --delete ${target_branch}
# Create branch
git checkout --branch ${target_branch}
# Push creation to remote
git push origin ${target_branch}
