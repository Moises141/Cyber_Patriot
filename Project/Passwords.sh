#!/bin/bash
echo "You have selected Option Five"
sleep 3
clear
choose() { echo ${1:RANDOM%${#1}:1}; }

{
    choose '!@#$%^\&amp;'
    choose '0123456789'
    choose 'abcdefghijklmnopqrstuvwxyz'
    choose 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
    for i in $( seq 1 $(( 4 + RANDOM % 8 )) )
    do
        choose '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    done
} | sort -R | tr -d '\n' > Master_Password.txt
value=$(<Master_Password.txt)
cat User_list.csv > User_list.txt
cat User_list.txt| awk -F ":" '{print $1}' /etc/passwd|awk 'p; /gdm/ {p=1}'|awk '{print  $1""$2":"$3""}'> Password.txt	
Passwd=$value
cat Password.txt|awk -v var="$Passwd" '{$2= var; print}' Password.txt >> Passwords.txt
sudo chpasswd < Passwords.txt && echo "You have successfully changed everyone's Passwords"
sleep 2
clear
sleep 3
echo Cleaning up cache files
sleep 2
clear
sudo rm -f Password.txt
sudo rm -f User_list.txt
sudo rm -f Master_Password.txt



