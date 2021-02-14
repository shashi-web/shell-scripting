#!/bin/bash
component=$1

if [ -z "${component}" ]; then
  echo "Need an input of component name"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-061c8355daa9a4394 --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=${component}}]"