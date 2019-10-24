#!/bin/bash
# This script sets the hostname for Ubuntu 18.04
while [[ -z "$HOSTNAME" ]]
do
read -p "New hostname: " HOSTNAME
done
hostnamectl set-hostname $HOSTNAME
echo "Hostname: $(hostname)"