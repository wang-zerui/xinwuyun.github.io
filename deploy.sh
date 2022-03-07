#!/bin/bash

# pull latest 
git pull

# remove cache dir
rm -rf _book/

# generate docs 
gitbook build

# copy to docs
cp -rf _book/* .

# add commits
git add .

# commit 
git commit -m "auto deploy website"

# push to github and others
git push origin 
