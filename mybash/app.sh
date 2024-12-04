#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# Store the original directory
MYBASH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Setup permissions for all scripts
find "$MYBASH_DIR" -type f -name "*.sh" -exec chmod +x {} \;

# Function to scan the folder and list scripts
scan_folder() {
  FILES_PATH=$(ls run/*.sh)
  INDEX=0
  FILES=()

  echo -e "${BLUE}=== Available Scripts ===${NORMAL}"
  for EACH_FILE in $FILES_PATH; do
    FILES+=("$EACH_FILE")
    echo -e "${GREEN}[$INDEX]${NORMAL} ${FILES[$INDEX]}"
    INDEX=$((INDEX + 1))
  done
  echo -e "${ORANGE}[b] Back to main menu${NORMAL}"
}

while true; do
  cd "$MYBASH_DIR"
  scan_folder
  read -p "Please enter your choice: " REPLY
  
  if [ "$REPLY" = "b" ]; then
    exit 0
  elif [[ $REPLY =~ ^[0-9]+$ ]] && [ $REPLY -ge 0 ] && [ $REPLY -lt $INDEX ]; then
    echo -e "${ORANGE}---> Selected Script: ${FILES[$REPLY]}...${NORMAL}"
    bash ${FILES[$REPLY]}
    cd "$MYBASH_DIR"
    echo -e "${GREEN}Script execution completed.${NORMAL}"
  else
    echo -e "${RED}Invalid choice. Please enter a valid number or 'b' to go back.${NORMAL}"
  fi
  echo -e "${BLUE}Press Enter to continue...${NORMAL}"
  read
done
