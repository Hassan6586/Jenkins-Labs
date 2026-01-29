#!/bin/bash
# Jenkins Lab 1 - Installing Jenkins and Agent Setup
#install Dedendices"
sudo apt update
sudo apt install -y openjdk-11-jdk
java -version

curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install -y jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkins
##Firewal Setup Role
sudo ufw allow 8080

#Password for Webpage Jenkis
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

sudo useradd -m -s /bin/bash jenkins-agent
echo 'jenkins-agent:agent123' | sudo chpasswd

sudo -u jenkins ssh -o StrictHostKeyChecking=no jenkins-agent@localhost "echo 'SSH successful'"
