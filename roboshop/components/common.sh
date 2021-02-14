#!/bin/bash

USER_ID=$(id -u)
if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31mYou must be a root user to execute the script\e[0m"
  exit 1
fi

#Linux-shell

#linux() {
#  echo -e "\e[1m$(date +%c) \e[35m$(hostname)\e[0m \e[36m${COMPONENT}\e[0m :: $1"
#}

#Maven-shell

maven(){
  echo -e "[\e[34mINFO\e[0m]------------------<$1>-----------------"
  echo -e "[\e[34mINFO\e[0m] \e[1m$2\e[0m"
  echo -e "[\e[34mINFO\e[0m]---------------------------------------"
  echo -e "[\e[34mINFO\e[0m]------ \e[31mSUCCESS\e[0m--------------"
}
