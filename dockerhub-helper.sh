#!/bin/bash

username=dockermeso
operation=pull

usage() {
  echo 'Usage: bash dockerhub-helper.sh -o push/pull | ./dockerhub-helper.sh -o push/pull'
  exit
}

push_to_dockerhub() {
  # Login dockerhub with password-stdin
  docker login -u $username --password-stdin < password.txt

  for repo in user-service expense-service notification-service ui; do 
  { 
    docker tag $repo $username/$repo && docker push $username/$repo
    docker rmi -f $username/$repo
  }&
  done 
  wait
}

pull_from_dockerhub() {

  for repo in user-service expense-service notification-service ui; do 
  { 
    docker rmi -f $repo
    docker pull $username/$repo
    docker tag $username/$repo $repo
    docker rmi -f $username/$repo
  }&
  done 
  wait
}

if [ "$#" -gt 2 ]
then
  usage
fi

while getopts o: option
do
    case "${option}"
    in
    o) operation=${OPTARG};;
    esac
done

if [ "$operation" = "pull" ]
then
  echo "--- Start pulling images ---"
  pull_from_dockerhub
else
  echo "--- Start pushing images ---"
  push_to_dockerhub
fi

echo "--- batch $operation DONE ---"
