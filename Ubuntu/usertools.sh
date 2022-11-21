#!/bin/bash
echo "Menu Options"
echo "_____________________________"
echo "1# add a User"
echo "2# remove a User"
echo "3# Promote User to Admin"
echo "4# Demote a Admin to Standard User"
echo "5# Create Passwords for All Users"
echo "___________________________________"
echo "please select an option"
sleep 2
read num
if  [ $num = 1 ]
then
   sh AddUsers.sh
elif [ "$num" = 2 ]
then
    sh RemoveUser.sh
elif [ "$num" = 3 ]
then
    sh Promote.sh
elif [ "$num" = 4 ]
then
    sh Demote.sh
elif [ "$num" = 5 ]
then
    sudo ./Passwords.sh
elif [ "$num" = 6 ]
then
    sh Network_tools.sh
elif [ "$num" = 7 ]
then
    sudo ./Firewall_setup.sh
elif [ "$num" = 8 ]
then
    sudo ./Programs.sh
else
    echo "Option is Invaid"
fi

