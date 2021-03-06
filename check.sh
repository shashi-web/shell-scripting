#!/bin/bash

read_line() {
  FILE=/Users/shashidharrao/Desktop/vishvesh/check.txt
  # CHECK IF IT HAS THIS STRING
  if grep -q siteActive=true "$FILE"; then
  Stat $? # SomeString was found
  fi
}
read_line

