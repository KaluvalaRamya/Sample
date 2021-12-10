#!/bin/bash

apt-get -y update
apt install -y openjdk-8-jdk    #Install java version 8
java -version                   #Check java version
echo "export java varaibales"
echo "JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/bin/java"" >> /etc/environment
echo "Restart source file"
source /etc/environment
echo "check JAVA_HOME path"
echo $JAVA_HOME
chmod 755 jenkins_installation_8080.sh # Remove write permissions to all others expect owner
./jenkins_installation_8080.sh # run the script