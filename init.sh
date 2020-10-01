#!/bin/sh

SOURCE_FOLDER_PATH='./source'

# Remove prev sources
rm -rf $SOURCE_FOLDER_PATH

# Set link to your GitHub repo
# Clone sources to ./source folder
git clone git@github.com:{user}/{repo}.git $SOURCE_FOLDER_PATH

sh './build.sh' init_deployment