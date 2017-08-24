#!/bin/bash
xargs -0 -n 1 git clone --mirror  < <(tr \\n \\0 <repo.list)
