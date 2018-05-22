#!/bin/bash
# rename [options] [Perl regex search/replace expression] [files]
# -v, --verbose
#           Verbose: print names of files successfully renamed.
#   -n, --no-act
 #          No Action: show what files would have been renamed.

rename -v -n  's/OLD/NEW/' *.png