#!/bin/bash
# Script to install Ansible on Linux

# Detect OS
OS=$(awk -F= '/^NAME/{print $2}' /etc/os-release)

echo "Detected OS: $OS"

if [[ "$OS" == *"Ubuntu"* ]]; then
    echo "Updating package lists..."
    sudo apt update -y
    echo "Installing software-properties-common..."
    sudo apt install -y software-properties-common
    echo "Adding Ansible PPA..."
    sudo add-apt-repository --yes --update ppa:ansible/ansible
    echo "Installing Ansible..."
    sudo apt install -y ansible

elif [[ "$OS" == *"Amazon"* ]] || [[ "$OS" == *"Amazon Linux"* ]]; then
    echo "Updating packages..."
    sudo yum update -y
    echo "Installing Ansible..."
    sudo amazon-linux-extras enable ansible2
    sudo yum install -y ansible

elif [[ "$OS" == *"CentOS"* ]] || [[ "$OS" == *"Red Hat"* ]]; then
    echo "Updating packages..."
    sudo yum update -y
    echo "Installing EPEL repo..."
    sudo yum install -y epel-release
    echo "Installing Ansible..."
    sudo yum install -y ansible

else
    echo "Unsupported OS. Please install Ansible manually."
    exit 1
fi

echo "Ansible installation completed."
ansible --version
