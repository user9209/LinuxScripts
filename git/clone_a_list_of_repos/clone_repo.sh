#!/bin/bash
xargs -0 -n 1 git clone < <(tr \\n \\0 <repo.list)
