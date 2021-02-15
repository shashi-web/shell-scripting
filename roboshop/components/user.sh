#!/bin/bash
COMPONENT=user
source components/common.sh
maven "Installing nodejs" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
stat $?
maven "adding Roboshop user" "useradd roboshop"
id roboshop || useradd roboshop
stat $?
maven "Download user component" "curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
"
curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
stat $?
maven "Extract user component code" "rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip "
rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip
stat $?
maven "Install nodejs dependences" "npm install"
npm install --unsafe-perm
stat $?
maven "Update systemd cart file" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsproject.tk' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service  /etc/systemd/system/catalogue.service"
sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsproject.tk/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service  /etc/systemd/system/catalogue.service
stat $?
maven "start user service" "systemctl daemon-reload && systemctl restart user && systemctl enable user "
systemctl daemon-reload && systemctl restart user && systemctl enable user
stat $?