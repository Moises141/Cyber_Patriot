#!/bin/bash
clear
echo "You have selected Option Four"
sleep 3
clear
echo "what is name of the user you would like to Promote to admin?"
read input
sudo usermod -aG sudo $input
echo "The User "$input "has Successfully added as a admin !"

