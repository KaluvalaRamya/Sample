#!/bin/bash
echo "installing java using other script in this repo"
sudo bash ../Java/install_java8.bash
echo "Installing jenkins server"
echo "Adding the Jenkins repository key to your system"
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
echo "Adding the repository in your apt configuration"
#echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee -a /etc/apt/sources.list
sudo sh -c 'echo deb https://pkg.jenkins.io/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
echo "update your package"
apt upgrade -y  # this step was added after we got an error with "no Release file found. Based on Google"
apt-get -y update
echo "Install jenkins"
apt-get -y install jenkins
sleep "30"
#echo "Change defualt port to 8082"
#sed -i 's/8080/8082/' /etc/default/jenkins
echo "Allowing users to signup"
sed -i 's/<disableSignup>true<\/disableSignup>/<disableSignup>false<\/disableSignup>/' /var/lib/jenkins/config.$
echo "Restart jenkins server"
systemctl restart jenkins
apt-get install jenkins=2.319
echo "Iniatial admin password"
cat /var/lib/jenkins/secrets/initialAdminPassword
echo "access your server on browser by <public-ip>:8080"

