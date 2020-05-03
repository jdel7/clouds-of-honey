#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install build-essential clang libssh-dev libjson-c-dev -y

cp /tmp/sshd_config /etc/ssh/
git clone https://github.com/droberson/ssh-honeypot.git
cd ssh-honeypot
make install
systemctl enable --now ssh-honeypot

# cp /tmp/sshd-second_config /etc/ssh/
# cp /tmp/sshd-second.service /etc/systemd/system/
# systemctl daemon-reload
# systemctl enable sshd-second.service --now
