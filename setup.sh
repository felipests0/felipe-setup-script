#!/bin/bash

# Script to install programs for my Ubuntu setup after installing the OS
# Autor: felipests0

echo "--- Starting Installation ---"

# 1. Update System
sudo apt update && sudo apt upgrade -y

# 2. Install via Snap (Dev Tools & IDEs)
# Note: No '-y' for snap as it doesn't support it.
echo "Installing tools via Snap..."
sudo snap install postman
sudo snap install code --classic
sudo snap install go --classic
sudo snap install datagrip --classic
sudo snap install drawio
sudo snap install microk8s --classic

# 3. Configure MicroK8s
echo "Configuring MicroK8s..."
sudo usermod -aG microk8s $USER
sudo microk8s status --wait-ready
sudo microk8s enable dashboard dns registry istio

# Create permanent alias for kubectl (k)
if ! grep -q 'alias k=' ~/.bashrc; then
    echo 'alias k="microk8s kubectl"' >> ~/.bashrc
    echo "Alias 'k' added to .bashrc"
fi

# 4. Install via APT (System & Networking)
echo "Installing Wireshark, htop and dependencies..."
sudo apt install -y wireshark htop filezilla ca-certificates curl

# 5. Install Docker (Official Repository)
echo "Installing Docker Engine..."
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository using the modern .sources format (DEB822)
sudo tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# 6. User Permissions
# Adding felipe to docker and wireshark groups
sudo usermod -aG docker $USER
sudo usermod -aG wireshark $USER

echo "####################################################"
echo "### Installation Finished! Please restart/logout ###"
echo "####################################################"
