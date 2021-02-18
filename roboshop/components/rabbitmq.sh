#!/bin/bash
COMPONENT=rabbitmq
source components/common.sh

yum list installed | grep esl-erlang
if [ $? -ne 0  ]; then
  maven "Install Erlang" "yum install https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_22.2.1-1~centos~7_amd64.rpm -y"
  yum install https://packages.erlang-solutions.com/erlang/rpm/centos/7/x86_64/esl-erlang_22.2.1-1~centos~7_amd64.rpm -y
  stat $?
fi

maven "setup YUM repo" "curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash"
curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
stat $?

maven "install rabbitmq" "yum install rabbitmq-server -y"
yum install rabbitmq-server -y
stat $?

maven "start rabbitmq" ""
systemctl enable rabbitmq-server && systemctl start rabbitmq-server
stat $?

maven "create rabbitmq user" ""
rabbitmqctl add_user roboshop roboshop123 && rabbitmqctl set_user_tags roboshop administrator && rabbitmqctl set_permissions -p / roboshop ".*" ".*" ".*"
stat $?