#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# build
hugo #-t hugo-steam-theme

# commit public site
cd public
git add -A

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master

cd ..

# commit source
git add -A

msg="new site changes `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

git push origin master
