#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== PNPM Installation Script ===${NORMAL}"

# Check if PNPM is already installed
if command -v pnpm &> /dev/null; then
    echo -e "${GREEN}PNPM is already installed!${NORMAL}"
    echo -e "${BLUE}Current PNPM version: ${NORMAL}$(pnpm -v)"
    exit 0
fi

# If not installed, proceed with installation
echo -e "${GREEN}PNPM not found. Starting installation...${NORMAL}"

# Step 1: Update Package Lists
echo -e "${GREEN}Updating package lists...${NORMAL}"
sudo apt-get update

# Step 2: Install Node.js and NPM
echo -e "${GREEN}Installing Node.js and NPM...${NORMAL}"
sudo apt-get install -y nodejs npm

# Step 3: Install PNPM
echo -e "${GREEN}Installing pnpm globally...${NORMAL}"
sudo npm install -g pnpm

# Step 4: Verify PNPM Installation
if command -v pnpm &> /dev/null; then
    echo -e "${GREEN}PNPM installed successfully!${NORMAL}"
    echo -e "${BLUE}PNPM version: ${NORMAL}$(pnpm -v)"
else
    echo -e "${RED}PNPM installation failed.${NORMAL}"
    exit 1
fi

# Setup pnpm environment
echo -e "${GREEN}Setting up pnpm environment...${NORMAL}"
pnpm setup

# Remind user to restart terminal
echo -e "${ORANGE}Note: You may need to restart your terminal for all changes to take effect.${NORMAL}" 