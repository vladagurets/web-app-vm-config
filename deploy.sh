#!/bin/sh

# Arguments from triggered hook (response from GitHub, 'pass-arguments-to-command' from hooks.json config)
COMMIT_HASH=$1
COMMIT_AUTOR_NAME=$2
COMMIT_AUTOR_EMAIL=$3

REPO_NAME='app'
IMAGE_NAME="${REPO_NAME}${COMMIT_HASH}"
CONTAINER_NAME="${REPO_NAME}_container_${COMMIT_HASH}"
SOURCE_FOLDER_PATH='./source'

# Get current container and image ids
CURRENT_CONTAINER_ID=$(docker ps | grep $REPO_NAME | awk '{print $1}')
CURRENT_IMAGE_ID=$(docker image ls | grep $REPO_NAME | awk '{print $1}')

# Get updates from remote repo
(cd $SOURCE_FOLDER_PATH && git pull origin master) && \

# Build new image with latest commit hash
docker build $SOURCE_FOLDER_PATH -t $IMAGE_NAME && \

# Stop and remove active container
[ -z "$CURRENT_CONTAINER_ID" ] && true || docker rm -f $CURRENT_CONTAINER_ID && \

# Remove prev image
[ -z "$CURRENT_IMAGE_ID" ] && true || docker image rm -f $CURRENT_IMAGE_ID && \

# Run new container
docker container run -d --name $CONTAINER_NAME -p 80:3000 $IMAGE_NAME