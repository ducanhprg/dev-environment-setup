#!/bin/bash

# Function to check if Docker is installed
check_docker_installed() {
    if command -v docker &> /dev/null; then
        echo "Docker is already installed."
        return 0
    else
        echo "Docker is not installed."
        return 1
    fi
}

# Function to install or update Docker
install_or_update_docker() {
    echo "Updating system and installing Docker..."
    sudo yum update -y
    sudo yum install -y docker

    # Enable and start Docker service
    sudo systemctl enable docker
    sudo systemctl start docker

    # Add ec2-user to the docker group to allow running Docker without sudo
    sudo usermod -aG docker ec2-user

    echo "Docker installation/update completed."
}

# Function to verify Docker installation
check_docker_version() {
    if command -v docker &> /dev/null; then
        echo "Docker version: $(docker --version)"
    else
        echo "Docker is not found. Please restart your shell or run: source ~/.bashrc"
    fi
}

# Run the functions
if check_docker_installed; then
    echo "Updating Docker..."
else
    echo "Installing Docker..."
fi

install_or_update_docker
check_docker_version

# Restart shell session to apply user group changes
echo "To use Docker without sudo, log out and log back in or run: newgrp docker"
