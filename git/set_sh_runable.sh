#!/bin/bash
git add ./*.sh
find . -name *.sh -print0 | xargs -0 git update-index --chmod=+x
