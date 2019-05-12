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
# Add changes to git:
git add .

# Commit changes:
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos:
git push origin master

# Come Back up to the Project Root:
cd ..