#!/bin/bash

. config-akash
. config-docker-version

echo CONTAINER_BUILD_DATE=$CONTAINER_BUILD_DATE
echo CONTAINER_BUILD_VERSION=$CONTAINER_BUILD_VERSION

# Function to increment the version number
increment_version() {
  local v=$1
  local delim=.
  local array=($(echo "$v" | tr "$delim" '\n'))
  array[2]=$((array[2]+1))
  if [ ${array[2]} -eq 10 ]; then
    array[2]=0
    array[1]=$((array[1]+1))
    if [ ${array[1]} -eq 10 ]; then
      array[1]=0
      array[0]=$((array[0]+1))
    fi
  fi
  new_version=$(printf "%d.%d.%d\n" ${array[0]} ${array[1]} ${array[2]})
  echo $new_version
}

# Read the current version from the VERSION file
#current_version=$(cat VERSION)
current_version=$CONTAINER_BUILD_VERSION
echo "Current version: $current_version"

# Increment the version
new_version=$(increment_version $current_version)
echo "New version: $new_version"

# Update the VERSION file with the new version
#echo $new_version > VERSION

# Get the current date
BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Build the Docker image with the new version and build date
#docker build --build-arg VERSION=$new_version --build-arg BUILD_DATE=$BUILD_DATE -t myapp:$new_version .

# Optionally, tag the latest version
#docker tag myapp:$new_version myapp:latest

#echo "Docker image built and tagged with version $new_version"

CONTAINER_BUILD_DATE=BUILD_DATE
CONTAINER_BUILD_VERSION=$new_version

echo CONTAINER_BUILD_DATE=$CONTAINER_BUILD_DATE > config-docker-version
echo CONTAINER_BUILD_VERSION=$CONTAINER_BUILD_VERSION >> config-docker-version

