#!/bin/bash

# Function to detect OS
detect_os() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        OS=$NAME
        VERSION=$VERSION_ID
    else
        echo "Could not detect OS"
        exit 1
    fi
}

# Function to check if running on Ubuntu
is_ubuntu() {
    if [[ "$OS" == "Ubuntu" ]]; then
        return 0
    else
        return 1
    fi
}

echo "Starting installation/update of all tools..."

# Detect OS
detect_os
echo "Detected OS: $OS $VERSION"

# Run each script in sequence based on OS
if is_ubuntu; then
    echo "Using Ubuntu-specific installation scripts..."
    bash ./install_or_update_docker_ubuntu.sh
    bash ./install_or_update_docker_compose.sh
    bash ./install_or_update_nvm.sh
    bash ./install_or_update_git_ubuntu.sh
    bash ./setup-ssh-ubuntu.sh
else
    echo "Using default installation scripts..."
    bash ./install_or_update_docker.sh
    bash ./install_or_update_docker_compose.sh
    bash ./install_or_update_nvm.sh
    bash ./install_or_update_git.sh
    bash ./setup-ssh-amazon.sh
fi

echo "All installations/updates completed. Please restart your terminal or source your profile (e.g., source ~/.bashrc) to apply changes."