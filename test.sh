#!/bin/bash

bundle update dependabot-omnibus

repo=$1
pm=$2
dir=$3
tag=kira-bot/tinfoil/${repo}${dir:+/$dir}:${pm}

echo "tag: $tag"

#DOCKER_BUILDKIT=0 docker build --pull --tag $tag . --build-arg PROJECT=$repo --build-arg PACKAGE_MANAGER_ARG=$pm --build-arg DIR=${dir} --build-arg KIRA_GITHUB_PERSONAL_TOKEN_ARG=$KIRA_GITHUB_PERSONAL_TOKEN --build-arg KIRA_GITLAB_PERSONAL_TOKEN_ARG=$KIRA_GITLAB_PERSONAL_TOKEN
DOCKER_BUILDKIT=0 docker build --tag $tag . --build-arg PROJECT=$repo --build-arg PACKAGE_MANAGER_ARG=$pm --build-arg DIR=${dir} --build-arg KIRA_GITHUB_PERSONAL_TOKEN_ARG=$KIRA_GITHUB_PERSONAL_TOKEN --build-arg KIRA_GITLAB_PERSONAL_TOKEN_ARG=$KIRA_GITLAB_PERSONAL_TOKEN
time docker run -it --rm $tag
docker rmi $tag
