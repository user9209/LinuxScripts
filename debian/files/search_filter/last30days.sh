#!/bin/bash
find $1 -mtime -30 -type f -print
# find $1 -mtime -30 -type f -print0 | ... --null