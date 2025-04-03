#!/bin/bash

# Define the NVM install URL
NVM_INSTALL_URL="https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh"

# Function to check if NVM is installed
check_nvm_installed() {
    if command -v nvm &> /dev/null; then
        echo "NVM is already installed."
        return 0
    else
        echo "NVM is not installed."
        return 1
    fi
}

# Function to install or update NVM
install_or_update_nvm() {
    echo "Downloading and installing/updating NVM..."
    curl -o- "$NVM_INSTALL_URL" | bash

    # Source the profile to load NVM
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

    echo "NVM installation/update completed."
}

# Function to check NVM version
check_nvm_version() {
    if command -v nvm &> /dev/null; then
        echo "NVM version: $(nvm --version)"
    else
        echo "NVM not found. Please restart your terminal or run: source ~/.bashrc"
    fi
}

install_node() {
    echo "Installing Node.js..."
    nvm install node
}

# Run the functions
if check_nvm_installed; then
    echo "Updating NVM..."
else
    echo "Installing NVM..."
fi

install_or_update_nvm
check_nvm_version
install_node