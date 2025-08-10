#!/bin/bash

set -e

./copy_tag.sh ${1} v1
./copy_tag.sh ${1} latest

cd ../../cache-apt-pkgs-action
for branch in dev staging master; do
  git switch ${branch}
  git fetch origin --tags --force
done
