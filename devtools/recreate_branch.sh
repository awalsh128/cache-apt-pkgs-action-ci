#!/bin/bash -x

set -e

source_branch="master"
target_branch="${1}"  # replaced 

# Include library.
source "$(dirname -- $(realpath -- ${0}))/lib.sh"

confirm_prompt "Do you want to push the branch reset on '${target_branch}' from '${source_branch}'?"

clone_repo_and_cd ${source_branch}
git branch -a

git branch ${target_branch}
git branch --delete ${target_branch}
git push origin --delete ${target_branch}

git branch ${target_branch}
git push origin ${target_branch}
