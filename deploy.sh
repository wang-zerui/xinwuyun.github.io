#!/bin/bash

# pull latest 
git pull

# remove cache dir

# generate docs 
gitbook build

# copy to docs
cp -rf _book/* .

# upload to https://github.com/xinwuyun/xinwuyun.github.io-scf
cd _book
rm package.json

git add .
git commit -m "auto deploy"
git push -u origin main

cd ..
# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin 
