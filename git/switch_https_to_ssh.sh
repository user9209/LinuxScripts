#!/bin/bash
#repo_url=`git remote show origin | grep 'URL zum Abholen: ' | grep -o -E "https://github.com/.+" | sed -rn 's/https:\/\/([^/]+)\/(.+)/git@\1:\2.git/p'`
repo_url=`git remote get-url origin`

#if [ "$repo_url" =~ "https://github.com/.+" ]
if [ "`echo $repo_url | grep -E 'https://.+'`" != "" ]
then
  git remote remove origin

  repo_url=`echo $repo_url | sed -rn 's/https:\/\/([^/]+)\/(.+)/git@\1:\2.git/p'`
  git remote add origin $repo_url

  git remote get-url origin
else
  echo "Repo is using ssh? '$repo_url'"
fi
