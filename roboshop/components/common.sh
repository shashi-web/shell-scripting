#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31mYou must be a root user to execute the script\e[0m"
  exit 1
fi

#Linux-shell

linux() {
  echo "\e[1m$(date +%c) \e[35m$(hostname)\e[0m \e[36m${COMPONENT}\e[0m :: $1"
}
