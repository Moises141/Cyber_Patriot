#!/bin/bash
clear
echo "You have selected Option Five"
sleep 3
clear
echo "what is name of the user you would like to Demote to Standard User?"
read input
sudo gpasswd --delete $input sudo 
echo "The User "$input "has Successfully Remove as a admin !"
