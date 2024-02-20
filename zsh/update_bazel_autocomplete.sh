#!/bin/bash -xeu

VERSION={:-6.4.0}

# https://stackoverflow.com/a/76614087
curl "https://raw.githubusercontent.com/bazelbuild/bazel/$VERSION/scripts/zsh_completion/_bazel" -o _bazel
cp _bazel  ~/.oh-my-zsh/completions/
