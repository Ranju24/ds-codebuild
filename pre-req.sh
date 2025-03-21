#!/bin/bash
apt-get update -y
apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
install -m 0755 -d /etc/apt/keyrings
mv /etc/apt/keyrings/docker.gpg /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
# Add Docker's stable repository (adjust distribution as needed)
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
# Update package lists again
apt-get update -y
# Install Docker CE
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# Install Node.js 20.x (or latest LTS)
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
apt-get install -y nodejs
# Install Python 3 and pip
apt-get install -y python3 python3-pip
# Install Python packages
pip3 install alembic pymysql awscli
pip3 install awscli
# Install serverless globally
npm install -g serverless
# Verify installations (optional, for debugging)
python3 --version
pip3 --version
docker --version
node --version
npm --version
aws --version
