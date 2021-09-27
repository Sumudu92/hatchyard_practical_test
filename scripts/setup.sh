#!/bin/bash
set -x

# Install necessary dependencies
sudo apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" dist-upgrade
sudo apt-get update
sudo apt-get -y -qq install curl wget git vim apt-transport-https ca-certificates

# Setup sudo to allow no-password sudo for "hashicorp" group and adding "terraform" user
sudo groupadd -r practicaltest
sudo useradd -m -s /bin/bash test
sudo usermod -a -G practicaltest test
sudo cp /etc/sudoers /etc/sudoers.orig
echo "test  ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/test

# Installing SSH key
sudo mkdir -p /home/test/.ssh
sudo chmod 700 /home/test/.ssh
sudo cp /tmp/practical-test.pub /home/test/.ssh/authorized_keys
sudo chmod 600 /home/test/.ssh/authorized_keys
sudo chown -R test /home/test/.ssh
sudo usermod --shell /bin/bash test

