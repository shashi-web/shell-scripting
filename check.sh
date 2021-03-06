#!/bin/bash

read_line() {
  # CHECK IF IT HAS THIS STRING
  if grep -q siteActive=true "$vishvesh"; then
  Stat $? # SomeString was found
  fi
}
