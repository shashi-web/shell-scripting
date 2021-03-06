#!/bin/bash

read_line() {
  FILE=/Users/shashidharrao/Desktop/vishvesh/check.txt
  # CHECK IF IT HAS THIS STRING
  if grep -q siteActive=false "$FILE"; then
  echo "found" # SomeString was found
  else
    echo"not found"
  fi
}
read_line

