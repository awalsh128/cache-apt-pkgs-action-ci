#!/bin/bash

cat test_template.yml | \
  sed -e 's/\$branch\$/staging/g' -e 's/\$branch_upper\$/Staging/g' -e 's/\$event_type\$/staging_push/g' \
  > .github/workflows/staging_test.yml

cat test_template.yml | \
  sed -e 's/\$branch\$/master/g' -e 's/\$branch_upper\$/Master/g' -e 's/\$event_type\$/master_push/g' \
  > .github/workflows/master_test.yml
