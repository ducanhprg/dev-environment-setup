#!/bin/bash

# Function to check if Git is installed
check_git_installed() {
    if command -v git &> /dev/null; then
        echo "Git is already installed."
        return 0
    else
        echo "Git is not installed."
        return 1
    fi
}

# Function to install or update Git
install_or_update_git() {
    echo "Updating system package list and installing/updating Git..."
    
    # Update package list
    sudo apt-get update
    
    # Install Git
    sudo apt-get install -y git
    
    echo "Git installation/update completed."
}

# Function to verify Git installation
check_git_version() {
    if command -v git &> /dev/null; then
        echo "Git version: $(git --version)"
    else
        echo "Git not found. Please restart your shell or run: source ~/.bashrc"
    fi
}

# Run the functions
if check_git_installed; then
    echo "Updating Git..."
else
    echo "Installing Git..."
fi

install_or_update_git
check_git_version 