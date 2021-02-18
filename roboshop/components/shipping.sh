#!/bin/bash
COMPONENT=shipping
source components/common.sh

maven "Install Maven" "yum install maven -y"
yum install maven -y
stat $?

maven "create roboshop user" "useradd roboshop"
id roboshop || useradd roboshop
stat $?

maven "Download the repo" 'curl -s -L -o /tmp/shipping.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/9c06b317-6353-43f6-81e2-aa4f5f258b2d/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"'
curl -s -L -o /tmp/shipping.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/9c06b317-6353-43f6-81e2-aa4f5f258b2d/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
stat $?

maven "extract shipping code" ""
cd /home/roboshop && rm -rf shipping && mkdir -p shipping && cd shipping && unzip -o /tmp/shipping.zip
stat $?

maven "compile code" "mv target/shipping-1.0.jar && shipping.jar"
mvn clean package && mv target/shipping-1.0.jar shipping.jar
stat $?

maven "update systemd script file" ""
sed -i -e "s/CARTENDPOINT/cart-ss.devopsproject.tk/" -e "s/DBHOST/mysql-ss.devopsproject.tk/" /home/roboshop/shipping/systemd.service
stat $?

maven "start shipping service" "mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service && systemctl daemon-reload && systemctl enable shipping && systemctl start shipping"
mv /home/roboshop/shipping/systemd.service /etc/systemd/system/shipping.service && systemctl daemon-reload && systemctl enable shipping && systemctl start shipping
stat $?