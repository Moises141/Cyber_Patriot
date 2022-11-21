#!/bin/bash
clear
echo "You have selected Option one"
sleep 3
clear
echo "what is name of the user you would like to add?"
read input
sudo useradd $input
echo "The User "$input "has Successfully added!"
