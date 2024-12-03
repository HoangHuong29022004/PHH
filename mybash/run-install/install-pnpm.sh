#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== PNPM Installation Script ===${NORMAL}"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}Node.js is not installed. Please install Node.js first.${NORMAL}"
    exit 1
fi

# Show current Node.js version
echo -e "${GREEN}Node.js version: ${NORMAL}$(node -v)"

# Check if pnpm is already installed
if command -v pnpm &> /dev/null; then
    echo -e "${GREEN}PNPM is already installed!${NORMAL}"
    echo -e "${BLUE}PNPM version: ${NORMAL}$(pnpm -v)"
    exit 0
fi

# Install pnpm using npm
echo -e "${GREEN}Installing pnpm globally...${NORMAL}"
npm install -g pnpm

# Verify installation
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