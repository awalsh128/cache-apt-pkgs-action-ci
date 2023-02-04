# Reference Sheet

Clobber local tags and pull from remote.

```sh
git fetch origin --tags --force
```

Cache Git credentials.

```sh
sudo apt install gitsome
gh configure
```

## Create a release

Put together package in GitHub UI @ https://github.com/awalsh128/cache-apt-pkgs-action/releases

Paste the example text below and edit as needed.

NOTE: Full change log is auto generated.

```md
## What's Changed

### Features

* Skip apt-fast installation on cache hit. https://github.com/awalsh128/cache-apt-pkgs-action/pull/61
* Add `execute_install_scripts` parameter for installation scripts feature, which tries to address APT install artifacts not covered by file capture. https://github.com/awalsh128/cache-apt-pkgs-action/issues/57
* Add `debug` parameter for debugging mode, that executes scripts in verbose and upload action logs.
* Remove compression from file caching. https://github.com/awalsh128/cache-apt-pkgs-action/pull/53
* Obsolete `refresh` parameter which has been non-functional for awhile.

### Bugs

* Cover no packages edge case when writing manifest.
* Migrate to new action output set ([info](https://github.blog/changelog/2022-10-11-github-actions-deprecating-save-state-and-set-output-commands/)).

## New Contributors
* @BoboTiG made their first contribution in https://github.com/awalsh128/cache-apt-pkgs-action/pull/61

**Full Changelog**: https://github.com/awalsh128/cache-apt-pkgs-action/compare/v1.1.2...v1.2.0
```

Then update the tags.

``sh
./update_release_tags.sh <tag>
``
