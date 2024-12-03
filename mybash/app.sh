#!/bin/bash

# Colors for output
NORMAL="\\033[0;39m"
GREEN="\\033[1;32m"
RED="\\033[1;31m"
BLUE="\\033[1;34m"
ORANGE="\\033[1;33m"

while true; do
  echo -e "${BLUE}=== Main Menu ===${NORMAL}"
  echo -e "${GREEN}[1]${NORMAL} Development Tools Installation"
  echo -e "${GREEN}[2]${NORMAL} System Configuration"
  echo -e "${GREEN}[q]${NORMAL} Quit"
  
  read -p "Please enter your choice: " REPLY
  
  case $REPLY in
    1)
      bash installs.sh
      ;;
    2)
      FILES_PATH=$(ls run/*.sh)
      INDEX=0
      declare -a FILES
      
      echo -e "${BLUE}=== System Configuration Scripts ===${NORMAL}"
      for EACH_FILE in $FILES_PATH; do
        FILES+=("$EACH_FILE")
        echo -e "${GREEN}[$INDEX]${NORMAL} ${FILES[$INDEX]}"
        INDEX=$((INDEX + 1))
      done
      
      read -p "Please enter the number of your choice: " CHOICE
      if [[ $CHOICE =~ ^[0-9]+$ ]] && [ $CHOICE -ge 0 ] && [ $CHOICE -lt $INDEX ]; then
        echo -e "${ORANGE}---> Selected Script: ${FILES[$CHOICE]}...${NORMAL}"
        bash ${FILES[$CHOICE]}
        echo -e "${GREEN}Script execution completed.${NORMAL}"
      else
        echo -e "${RED}Invalid choice.${NORMAL}"
      fi
      ;;
    q)
      echo -e "${BLUE}Goodbye!${NORMAL}"
      exit 0
      ;;
    *)
      echo -e "${RED}Invalid choice.${NORMAL}"
      ;;
  esac
done
