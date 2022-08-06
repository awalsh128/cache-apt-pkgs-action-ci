#!/bin/bash

# Include library.
source "$(dirname -- $(realpath -- ${0}))/lib.sh"

tag="${1}"
validate_arg "${tag}" "Tag arg must be non-empty."

confirm_prompt "Do you want to update the 'latest' tag from tag ${tag}?"

clone_repo_and_cd "${tag}"
git tag -d latest
git tag latest -fa -m "Points to the latest release."
git push origin :refs/tags/latest
git push origin refs/tags/latest

for t in $(git tag); do
  echo -e "$t\t$(git show $t | grep commit | awk '{print $2}')"
done

echo "Updated the `latest` tag to ${tag}."