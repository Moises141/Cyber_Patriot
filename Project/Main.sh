#!/bin/bash
echo "Made by Moises Beleche"
echo "Ubuntu Script"
echo "______________________"
cat /etc/passwd| grep "/home"|awk -F ':' '$3 >=1000 {print}' >> User_list.csv
echo What are the current administrators on this machine?
echo --------------------------------------------------------------
echo "Please note that you will need to separate names with a comma."
read Names
sleep 2
clear
echo Checking list of admins on the system
sleep 3
clear
echo $Names >> Userlist_admin.csv
grep -Po '^sudo.+:\K.*$' /etc/group >> SystemList_admin.csv
if diff Userlist_admin.csv SystemList_admin.csv; then
echo "All administrators have been accounted for."
else
echo "There is unauthorized personnel or missing admin"
fi
sleep 3
clear
echo clear data cache files
sudo rm -f Userlist_admin.csv
sleep 3
clear
echo please look at your Desktop for list for users
sleep 3
clear
read -p "Do you want to edit any users? (y/n) " yn
case $yn in 
	yes ) echo ok, we will proceed;
		echo "loading tools"|sh usertools.sh;;
	no ) echo exiting...;
		exit;;
	* ) echo invalid response;;
esac
sudo rm -f 
clear
