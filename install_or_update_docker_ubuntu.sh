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
    echo "Setting up Docker repository and installing Docker..."
    
    # Remove any old versions
    sudo apt-get remove docker docker-engine docker.io containerd runc -y
    
    # Update package index
    sudo apt-get update
    
    # Install prerequisites
    sudo apt-get install -y \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    
    # Add Docker's official GPG key
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    
    # Set up the repository
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Update package index again
    sudo apt-get update
    
    # Install Docker Engine
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
    
    # Add current user to docker group
    sudo usermod -aG docker $USER
    
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