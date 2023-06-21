#!/bin/bash

rm -rf repos

# Download all repos in parallel
for repo_name in user-service expense-service notification-service application-web; do 
{ 
  git clone git@github.com:twinva1/$repo_name.git repos/$repo_name
}&
done 
wait

# Start All Services
docker-compose -f docker-compose-basic.yml up -d