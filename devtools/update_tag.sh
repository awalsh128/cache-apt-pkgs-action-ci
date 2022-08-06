#!/bin/bash

set -e

tag="${1}"

# Include library.
source "$(dirname -- $(realpath -- ${0}))/lib.sh"

commit_ver=$(git log --name-status HEAD^..HEAD | head -1 | awk '{print $2}')
commit_timestamp=$(git show -s --format=%ci ${commit_ver})
confirm_prompt "Do you want to update tag ${tag} with the latest commit at ${commit_timestamp}?"

clone_repo_and_cd
git push origin :refs/tags/${tag}
git tag -fa ${tag}
git push origin master --tags
