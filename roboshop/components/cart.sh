#!/bin/bash
COMPONENT=cart
source components/common.sh
maven "Installing nodejs" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
stat $?
maven "adding Roboshop user" "useradd roboshop"
id roboshop || useradd roboshop
stat $?
maven "Download catalogue component" "curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
"
curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
stat $?
maven "Extract cart component code" "rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip "
rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip
stat $?
maven "Install nodejs dependences" "npm install"
npm install --unsafe-perm
stat $?
chown roboshop:roboshop /home/roboshop -R
maven "Update systemd cart file" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.devopsproject.tk' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service  /etc/systemd/system/catalogue.service"
sed -i -e 's/REDIS_ENDPOINT/redis-ss.devopsproject.tk/' -e 's/CATALOGUE_ENDPOINT/catalogue-ss.devopsproject.tk/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
stat $?
maven "start cart service" "systemctl daemon-reload && systemctl restart cart && systemctl enable cart "
systemctl daemon-reload && systemctl restart cart && systemctl enable cart
stat $?