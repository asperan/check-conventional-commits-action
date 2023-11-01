#!/usr/bin/env bash

# Check if `git` exists in the current env.
if ! command -v git &> /dev/null; then
    echo "git could not be found"
    exit 2
fi

ERRORS=`git log --grep='^\w+(\((\w|-)+\))?!?: .+$' --invert-grep -E --pretty=format:%s | awk 'END {print NR}'`
echo "$ERRORS"

if [[ -n $GITHUB_ACTIONS && $GITHUB_ACTIONS == true ]]; then
    # Print to github_output only in a Github Actions environment.
    echo "errors=$ERRORS" >> "$GITHUB_OUTPUT"
fi
