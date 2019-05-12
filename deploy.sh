#!/usr/bin/env bash

# Hugo site deploy script
# Original author: the Hugo project
# https://gohugo.io/hosting-and-deployment/hosting-on-github/
# Tweaks by Grant Barton


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project:
hugo --minify -v

# Go To Public folder:
cd public
# Copy the license and README:
cp ../LICENSE ./
cp ../README.md ./
cp ../favicon.ico ./
# Add changes to git:
git add .

# Commit changes to build repo:
msg="Updating site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push build repo:
git push origin master

# Come Back up to the Project Root:
cd ..

# Add changes to git:
git add ./*

# Commit changes to source:
git commit -m "$msg"

# Push source repo:
git push origin master
