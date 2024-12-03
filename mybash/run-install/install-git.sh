#!/bin/bash

echo "Checking if Git is already installed..."
if command -v git &> /dev/null; then
    echo "Git is already installed!"
    git --version
    exit 0
fi

echo "Updating package list..."
sudo apt update

echo "Installing Git..."
sudo apt install -y git

echo "Git installation complete."
git --version
