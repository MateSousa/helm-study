#!/bin/bash

# Define variables
DOCKER_IMAGE="app-helm"
HELM_CHART_DIR="./app-helm"

# Change directory to root of project
cd "$(dirname "$0")/.."

# Remove the docker image from docker
docker rmi "$DOCKER_IMAGE"

# Remove the docker image from minikube
minikube image rm "$DOCKER_IMAGE" 

# Build and tag the docker image 
docker build -t "$DOCKER_IMAGE" .

# Load the Docker image into Minikube
minikube image load "$DOCKER_IMAGE:latest"

# Deploy the Helm chart, upgrading if already installed
helm upgrade --install "$DOCKER_IMAGE" "$HELM_CHART_DIR"

# Get the Minikube IP
minikube ip
