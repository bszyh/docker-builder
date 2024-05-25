#!/bin/sh
# apline doesn't have bash by default, so use sh

# dockerized version of the script
#1) clone git repository

git clone "https://github.com/$1" || exit # exit if command fails

# change directory to cloned repo, exit script if the command fails

cd "$(basename -- $1)" || exit # -- means end of options, if $1 starts with - then command wont interpret it as option

#2) build docker image from dockerfile

docker build -t $2 . || exit

#3) push the image to the dockerhub repo

# docker hub login and authentication - for dockerized excercise we are using env variables passed to the container
echo "$DOCKER_TOKEN" | docker login -u $DOCKER_USER --password-stdin
unset DOCKER_TOKEN

docker push $2 || exit
