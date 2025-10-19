#!/bin/bash
echo "=== Jenkins Installation Verification ==="
echo

echo "1. Jenkins Master Status:"
sudo systemctl is-active jenkins
echo

echo "2. Listening Port:"
sudo netstat -tlnp | grep :8080 || echo "Port not open"
echo

echo "3. Jenkins Users:"
ls /var/lib/jenkins/users/ 2>/dev/null || echo "Users not found"
echo

echo "4. Agent Directory:"
ls /home/jenkins-agent/jenkins-agent 2>/dev/null || echo "Agent directory missing"
echo

echo "5. Plugins Count:"
ls /var/lib/jenkins/plugins/*.hpi 2>/dev/null | wc -l
echo

echo "=== Verification Complete ✅ ==="
