#!/bin/bash

# Get the latest Docker Compose version from GitHub API
DOCKER_COMPOSE_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")')

# Define install path
COMPOSE_PATH="/usr/local/bin/docker-compose"

echo "Installing Docker Compose v${DOCKER_COMPOSE_VERSION}..."

# Download and install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/${DOCKER_COMPOSE_VERSION}/docker-compose-linux-x86_64" -o $COMPOSE_PATH

# Set execute permissions
sudo chmod +x $COMPOSE_PATH

# Create a symbolic link for `docker compose` command
sudo ln -sf $COMPOSE_PATH /usr/bin/docker-compose

# Verify installation
if docker-compose version &> /dev/null; then
    echo "Docker Compose successfully installed/updated!"
    docker-compose version
else
    echo "Docker Compose installation failed!"
fi
