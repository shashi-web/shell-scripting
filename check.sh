#!/bin/bash

read_line() {
  # shellcheck disable=SC2125
  FILE=/Users/shashidharrao/Desktop/vishvesh/*
  # CHECK IF IT HAS THIS STRING
  if grep -q siteActive=true "$FILE"; then
  echo "found" # SomeString was found
  else
    echo "not found"
  fi
}
read_line

