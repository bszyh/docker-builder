#!/usr/bin/bash
echo "Script clones the given GitHub repo, builds image from Dockerfile and publishes it to the Docker Hub"

#1) clone git repository

git clone "https://github.com/$1" || exit # exit if command fails

# change directory to cloned repo, exit script if the command fails

echo "Moving inside the repo directory... "
cd "$(basename -- $1)" || exit # -- means end of options, if $1 starts with - then command wont interpret it as option
pwd # check the current working directory

#2) build docker image from dockerfile

docker build -t $2 . || exit

#3) push the image to the dockerhub repo

# docker hub login and authentication
read -p "Docker Hub username: " DOCKER_USER
read -s -p "Personal Access Token: " DOCKER_TOKEN # -s dont echo input coming from terminal -p prompt
echo "$DOCKER_TOKEN" | docker login -u $DOCKER_USER --password-stdin
unset DOCKER_TOKEN

docker push $2 || exit
