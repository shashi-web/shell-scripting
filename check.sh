#!/bin/bash

read_line() {
  # CHECK IF IT HAS THIS STRING
  FILE="/Users/shashidharrao/Desktop/vishvesh/test.txt"
  STRING="siteActive=true"
  EXIT=1
   while [ $EXIT -ne 0 ]; do
    if [ -f $FILE ] ; then
      CHECK IF THE "STRING" IS IN THE FILE - IF YES echo "FOUND"; EXIT=0;
    fi
   done
}
