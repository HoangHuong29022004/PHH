#!/bin/bash

echo "Updating package list..."
sudo apt update

echo "Installing Git..."
sudo apt install -y git

echo "Git installation complete."
git --version 