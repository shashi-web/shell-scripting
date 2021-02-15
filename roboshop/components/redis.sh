#!/bin/bash
COMPONENT=redis
source components/common.sh
maven "Install Redis repos" "yum install epel-release yum-utils -y"
yum install epel-release yum-utils -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
stat $?
maven "install redis" "yum-config-manager --enable remi && yum install redis -y"
yum-config-manager --enable remi && yum install redis -y
stat $?
maven "Update the BindIP from 127.0.0.1 to 0.0.0.0 in config file /etc/redis.conf" ""
sed -e -i 's/127.0.0.1/0.0.0.0' /etc/redis.conf
stat $?
maven "Start Redis Database" "systemctl enable redis && systemctl start redis"
systemctl enable redis && systemctl start redis
stat $?