# 🧰 Jenkins Lab 1 — Installing Jenkins (Master & Agent Setup)

Welcome to **Lab 1: Installing Jenkins** — a beginner-friendly, step-by-step guide to set up Jenkins on Linux and configure a basic master–agent environment.

## 🎯 Objectives
By the end of this lab, you will:
- Install Jenkins using the package manager  
- Configure Jenkins master node and security settings  
- Create and connect an agent node on the same system  
- Verify distributed build setup  
- Run a sample test job to confirm everything works  

## 🧑‍💻 Prerequisites
- Basic Linux command-line knowledge  
- Java 11 installed  
- Internet connection  
- sudo access  

## ⚙️ Setup Steps
1. **Update and install Java:**
   ```bash
   sudo apt update
   sudo apt install -y openjdk-11-jdk
   java -version
   ```

2. **Add Jenkins repo and install Jenkins:**
   ```bash
   curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
   sudo apt update
   sudo apt install -y jenkins
   ```

3. **Start Jenkins:**
   ```bash
   sudo systemctl start jenkins
   sudo systemctl enable jenkins
   ```

4. **Open firewall port 8080:**
   ```bash
   sudo ufw allow 8080
   ```

5. **Get admin password:**
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```

6. **Access Jenkins:**
   Open in your browser → [http://localhost:8080](http://localhost:8080)

7. **Create an agent user:**
   ```bash
   sudo useradd -m -s /bin/bash jenkins-agent
   echo 'jenkins-agent:agent123' | sudo chpasswd
   ```

8. **Test connection:**
   ```bash
   sudo -u jenkins ssh -o StrictHostKeyChecking=no jenkins-agent@localhost "echo 'SSH successful'"
   ```

9. **Run verification script:**
   ```bash
   bash verification.sh
   ```

## 💡 Why This Lab Matters
This lab gives you a **foundation for CI/CD automation** — how Jenkins orchestrates distributed builds with master–agent architecture.

## 🧰 Next Steps
Proceed to **Lab 2: Jenkins Pipeline Basics**, where you’ll create and run your first CI/CD pipeline script.

**Author:** Hassan  
**Repo:** [Jenkins-Labs](https://github.com/Hassan6586/Jenkins-Labs)
