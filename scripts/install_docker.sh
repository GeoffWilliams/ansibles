#!/bin/bash

# VM user must be ubuntu!

export DEBIAN_FRONTEND=noninteractive

# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
echo "Repo key..."
apt-get update
apt-get install -y ca-certificates curl gnupg jq
install -m 0755 -d /etc/apt/keyrings
rm -f /etc/apt/keyrings/docker.gpg
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "done!"

# Add the repository to Apt sources:
echo "apt sources"
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "done!"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
echo "installed!"
usermod -aG docker ubuntu
