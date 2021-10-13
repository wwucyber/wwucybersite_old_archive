#!/usr/bin/env bash

# Hugo site deploy script
# Original author: the Hugo project
# https://gohugo.io/hosting-and-deployment/hosting-on-github/
# Tweaks by Grant Barton and Nathan Burns


echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project:
echo "Building Hugo Project.."
hugo -v

# Go To Public folder:
cd public
# Copy the license and README:
cp ../LICENSE ./
cp ../README.md ./
cp ../favicon.ico ./

#Move into root folder so git diff shows more than just posts
cd ..
#Show user what they are committing
git diff

#Prompt to make sure they know what's going on
while true; do
    read -p "Please read the above git message and be sure you are aware of what changes you are pushing to live. Y to push N to exit. (y/n)" yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Yes or No";;
    esac
done

#Move back to public
cd public

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
git add .

# Commit changes to source:
git commit -m "$msg"

# Push source repo:
git push origin master
