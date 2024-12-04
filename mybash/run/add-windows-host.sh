#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

echo -e "${BLUE}=== Add Windows Hosts Entry ===${NORMAL}"

# Prompt for hostname
read -p "Enter hostname (e.g., demo.code): " hostname

# Open hosts file in Notepad++ with admin privileges
powershell.exe -Command "Start-Process 'C:\Program Files\Notepad++\notepad++.exe' -ArgumentList 'C:\Windows\System32\drivers\etc\hosts' -Verb RunAs"

# Display the entry to copy
echo -e "${GREEN}=== Copy this line (Ctrl+C) ===${NORMAL}"
echo "127.0.0.1       $hostname"
echo -e "${GREEN}==============================${NORMAL}"

echo -e "${ORANGE}Please follow these steps:${NORMAL}"
echo -e "${GREEN}1. Paste the line at the end of the hosts file (Ctrl+V)${NORMAL}"
echo -e "${GREEN}2. Save the file (Ctrl+S) and close Notepad++${NORMAL}"

echo -e "${BLUE}After saving, your new host entry will be active.${NORMAL}"
