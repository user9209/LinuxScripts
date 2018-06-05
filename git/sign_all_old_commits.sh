#!/bin/bash
# Sign all commits up to the given hash
git rebase --exec 'git commit --amend --no-edit -n -S' -i <hash>