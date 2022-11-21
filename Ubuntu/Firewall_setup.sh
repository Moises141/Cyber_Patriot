 #!/bin/bash
 echo "You have selected Option Seven"
 sleep 3
 clear
 sleep 3
 sudo apt install ufw
 sudo apt install gutw
 clear
# config for Firewall rules
echo Configuring Firewall ....
sleep 3
clear
sudo ufw enable
sudo ufw deny 1337
sudo ufw deny telnet
sudo ufw deny http
sudo ufw default allow outgoing
sudo ufw default deny incoming
clear
