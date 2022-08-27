#!/bin/bash

file=/home/AnsibleUser/TestUser

Account_Type=("system_Account" "Admin_Account" "system_Account")
Account_Name=("AnsibleUser" "osboxes" "Rohan")

while read line
do
	str="$line"
	len=${#Account_Name[@]}
	i=0
	while [ $i -lt $len ]; do
		if [[ $str = "${Account_Name[$i]}" ]];
		then
			status=${Account_Type[$i]}
			break
		else
			status="Personal_Account"
		fi
		let i++
	done
	echo "$status" >> /home/AnsibleUser/Accounts
done< $file
