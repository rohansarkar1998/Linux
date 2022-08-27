#!/bin/bash
ls -l /home | awk '{print $9}' > testUser3
file=/home/AnsibleUser/testUser3
Account_Type=("Admin_Account" "System_Account" "Support_Account")
account_Name=("osboxes" "Rohan" "Messi")
user=()
while read line
do
        str="$line"
	len=0
	status=''
        name=''
	user=$(id $str)
        if [[ $user == *"uid"* && $str != '' ]];
        then
		len=${#account_Name[@]}
		i=0
		while [ $i -lt $len ]; do
			if [[ $line = "${account_Name[$i]}" ]];
			then
				status=${Account_Type[$i]}
				break
			else
				status="Normal_Account"
			fi

			let i++
		done

                num=$(grep -c "$line" /etc/sudoers)
		echo "$num"
		if [[ $num -gt 0 ]];
                then 
                     name="$str     $status   Sudo"
		else
		      name="$str   $status    NonSudo"
                fi
	fi
	if [[ $name != '' ]]; then
		echo "$name" >> /home/AnsibleUser/ResultofUsers
	fi
	

done< $file

