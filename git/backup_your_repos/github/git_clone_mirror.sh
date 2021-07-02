#!/bin/bash
while read repo; do
  if [ ! -z "${repo}" ]
  then
    git clone --mirror $repo
	echo "Done: $repo"
  fi
done <repo.list
