# 🧩 Troubleshooting Jenkins Setup

### ❌ Jenkins Service Won’t Start
```bash
sudo systemctl status jenkins
sudo journalctl -u jenkins -f
```
**Fix:** Check Java installation and restart Jenkins.
```bash
java -version
sudo systemctl restart jenkins
```

### ❌ Port 8080 Already in Use
```bash
sudo lsof -i :8080
sudo sed -i 's/HTTP_PORT=8080/HTTP_PORT=8081/' /etc/default/jenkins
sudo systemctl restart jenkins
```

### ❌ Agent Can’t Connect
```bash
sudo -u jenkins ssh jenkins-agent@localhost
```
**Fix:** Recheck SSH permissions:
```bash
ls -la /var/lib/jenkins/.ssh/
ls -la /home/jenkins-agent/.ssh/
```
