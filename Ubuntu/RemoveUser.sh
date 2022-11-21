#!/bin/bash
clear
echo "You have selected Option Two"
sleep 3
clear
echo "what is name of the user you would like to Remove?"
read input
sudo userdel $input
echo "The User "$input "has Successfully Removed!"
