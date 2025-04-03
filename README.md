# Development Environment Setup Scripts

A collection of scripts to automate the setup of development environments across different Linux distributions. These scripts handle the installation and configuration of essential development tools and dependencies.

## Features

- **Multi-Distribution Support**
  - Ubuntu 22.04
  - Amazon Linux
  - (More distributions can be added)

- **Automated Tool Installation**
  - Docker and Docker Compose
  - Git
  - Node Version Manager (NVM)
  - SSH client and key setup

- **Smart Installation**
  - Checks for existing installations
  - Updates if already installed
  - Installs if not present
  - Verifies installations

## Prerequisites

- Linux-based operating system (Ubuntu 22.04 or Amazon Linux)
- Sudo privileges
- Internet connection for package downloads

## Installation

1. Clone this repository:
```bash
git clone <repository-url>
cd <repository-name>
```

2. Make the scripts executable:
```bash
chmod +x *.sh
```

3. Run the setup script:
```bash
./setup_all.sh
```

The script will automatically detect your operating system and use the appropriate installation scripts.

## What Gets Installed

### Docker
- Latest stable version of Docker Engine
- Docker Compose
- User added to docker group (requires logout/login)

### Git
- Latest stable version of Git
- Basic Git configuration

### NVM (Node Version Manager)
- Latest version of NVM
- Latest LTS version of Node.js

### SSH
- OpenSSH client
- SSH key generation (if not exists)
- Public key display

## Manual Installation

You can run individual scripts if you only need specific tools:

```bash
# For Ubuntu
./install_or_update_docker_ubuntu.sh
./install_or_update_git_ubuntu.sh
./setup-ssh-ubuntu.sh

# For Amazon Linux
./install_or_update_docker.sh
./install_or_update_git.sh
./setup-ssh-amazon.sh

# For all distributions
./install_or_update_nvm.sh
./install_or_update_docker_compose.sh
```

## Post-Installation Steps

After running the scripts, you may need to:

1. Log out and log back in for group changes to take effect
2. Source your profile:
```bash
source ~/.bashrc
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
