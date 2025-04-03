#!/bin/bash

# Function to check and install SSH
check_and_install_ssh() {
    if ! command -v ssh &> /dev/null; then
        echo "SSH is not installed. Installing..."
        sudo yum install -y openssh-clients
    else
        echo "SSH is already installed."
    fi
}

# Function to generate SSH key
generate_ssh_key() {
    SSH_KEY_PATH="$HOME/.ssh/id_rsa"

    if [ -f "$SSH_KEY_PATH" ]; then
        echo "SSH key already exists at $SSH_KEY_PATH"
    else
        echo "Generating new SSH key..."
        ssh-keygen -t rsa -b 4096 -N "" -f "$SSH_KEY_PATH"
    fi
}

# Function to display the public key
show_public_key() {
    echo "Public key content:"
    cat "$HOME/.ssh/id_rsa.pub"
}

# Run functions
check_and_install_ssh
generate_ssh_key
show_public_key
