#!/bin/bash

# Include library.
source "$(dirname -- $(realpath -- ${0}))/lib.sh"
usage_msg=$(usage ${0} "<source> <target>")

source_tag="${1}"
validate_arg "${source_tag}" "Source tag arg must be non-empty." "${usage_msg}"

target_tag="${2}"
validate_arg "${source_tag}" "Target tag arg must be non-empty." "${usage_msg}"

confirm_prompt "Do you want to update '${target_tag}' from '${source_tag}'?"

clone_repo_and_cd "${source_tag}"
git tag -d ${target_tag}
git tag ${target_tag} -fa -m "Points to ${source_tag} to ${target_tag}."
git push origin :refs/tags/${target_tag}
git push origin refs/tags/${target_tag}

for t in $(git tag); do
  echo -e "$t\t$(git show $t | grep commit | awk '{print $2}')"
done

echo "Updated '${target_tag}' tag to ${source_tag}."
