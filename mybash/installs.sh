#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# VARIABLES
FILES_PATH=$(ls run-install/*.sh)
INDEX=0
REPLY=""
declare -a FILES

scan_folder() {
  echo -e "${BLUE}=== Available Installation Scripts ===${NORMAL}"
  for EACH_FILE in $FILES_PATH; do
    FILES+=("$EACH_FILE")
    echo -e "${GREEN}[$INDEX]${NORMAL} ${FILES[$INDEX]}"
    INDEX=$((INDEX + 1))
  done
}

while true; do
  scan_folder
  echo -e "${ORANGE}[b] Back to main menu${NORMAL}"
  read -p "Please enter your choice: " REPLY
  
  if [ "$REPLY" = "b" ]; then
    exit 0
  elif [[ $REPLY =~ ^[0-9]+$ ]] && [ $REPLY -ge 0 ] && [ $REPLY -lt $INDEX ]; then
    echo -e "${ORANGE}---> Selected Installation: ${FILES[$REPLY]}...${NORMAL}"
    bash ${FILES[$REPLY]}
    echo -e "${GREEN}Installation completed.${NORMAL}"
  else
    echo -e "${RED}Invalid choice. Please enter a valid number or 'b' to go back.${NORMAL}"
  fi
  echo -e "${BLUE}Returning to installation menu...${NORMAL}"
done 