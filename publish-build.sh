#!/bin/bash

# Whitelist to keep, i.e. non-React
whitelist=('.gitignore' '404.html' 'README.md' 'publish-build.sh')

# Delete files outside of whitelist (should only be React build)
rm $(ls -ap ./ | grep -v / | grep -vE $(IFS="|" ; echo "${whitelist[*]}"))
rm -r ./static

# Copy over build to root for Github Pages
cp -r ./react/build/* ./