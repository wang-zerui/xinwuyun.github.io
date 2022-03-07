#!/bin/bash

# remove cache dir
rm -rf _book
# generate docs 
gitbook build

# copy to docs
cp -rf _book/* .

# upload to https://github.com/xinwuyun/xinwuyun.github.io-scf
cd _book
rm package.json

git init
git add .
git commit -m "auto deploy"
git remote add origin git@github.com:xinwuyun/xinwuyun.github.io-scf.git
git branch -M main
git push --force origin main

cd ..
# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin 
