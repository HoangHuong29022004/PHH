#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

# VARIABLES
FILES_PATH=$(ls run/*.sh)
INDEX=0
REPLY=""
declare -a FILES

scan_folder() {
  echo -e "${BLUE}=== Available Scripts ===${NORMAL}"
  for EACH_FILE in $FILES_PATH; do
    FILES+=("$EACH_FILE")
    echo -e "${GREEN}[$INDEX]${NORMAL} ${FILES[$INDEX]}"
    INDEX=$((INDEX + 1))
  done
}

scan_folder

while true; do
  read -p "Please enter the number of your choice: " REPLY
  if [[ $REPLY =~ ^[0-9]+$ ]] && [ $REPLY -ge 0 ] && [ $REPLY -lt $INDEX ]; then
    echo -e "${ORANGE}---> Selected Script: ${FILES[$REPLY]}...${NORMAL}"
    bash ${FILES[$REPLY]}
    break
  else
    echo -e "${RED}Invalid choice. Please enter a valid number between 0 and $((INDEX - 1)).${NORMAL}"
  fi
done
