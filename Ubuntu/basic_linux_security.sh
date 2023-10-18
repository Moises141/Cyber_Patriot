#!/bin/bash

# Basic Linux Security Script
# Disclaimer:
# This script is provided for educational and informational purposes only. It implements basic security measures
# that can help improve the security of a Linux system. However, it is not a comprehensive solution and may not
# cover all potential security risks. Use this script at your own risk, and make sure to understand and review
# the changes it makes to your system. Always have appropriate backups and recovery procedures in place.

# Ensure script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run this script as root or with sudo."
  exit 1
fi

# Update the package repositories and upgrade installed packages
echo "Updating package repositories and upgrading installed packages..."
apt update -y
apt upgrade -y

# Install essential security packages
echo "Installing essential security packages..."
apt install -y ufw fail2ban

# Enable the Uncomplicated Firewall (UFW)
echo "Configuring the firewall (UFW)..."
ufw allow OpenSSH  # Allow SSH
ufw enable
ufw status

# Configure Fail2Ban
echo "Configuring Fail2Ban..."
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
systemctl restart fail2ban
systemctl enable fail2ban
fail2ban-client status

# Disable root login and password-based authentication
echo "Disabling root login and password-based authentication in SSH..."
sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
systemctl restart sshd

# Set up automatic security updates
echo "Setting up automatic security updates..."
apt install -y unattended-upgrades
dpkg-reconfigure --priority=low unattended-upgrades

echo "Basic Linux security setup completed."
