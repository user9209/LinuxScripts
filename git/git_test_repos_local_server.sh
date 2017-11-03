#!/bin/bash

mkdir server
cd server
git init --bare

cd ..

git clone server local1
cd local1
git remote add origin ../server

head -c12 </dev/urandom|xxd -p -u >./demo.txt
git add ./demo.txt

git commit -m "demo" 
git push --set-upstream origin master

cd ..
git clone server local2
cd local2
git remote add origin ../server
git branch --set-upstream-to=origin/master master

git pull
