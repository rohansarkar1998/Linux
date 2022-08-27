#!/bin/bash
ls -l /home | awk '{print $9}' > testUser3
file=/home/AnsibleUser/testUser3
Account_Type=("Admin_Account" "System_Account" "Support_Account")
account_Name=("osboxes" "Rohan" "Messi")
filename=$(hostname -I | awk '{print $1}')
number=0
while read line
do
        str="$line"
	len=0
	status=''
        name=''
        prevelage=''
        owner='AWS Dl 1234-role'
        
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
		if [[ $num -gt 0 ]];
                then 
                     num1=$(grep -c "#$line" /etc/sudoers)
                     if [[ $num1 -gt 0 ]];
                     then
                          prevelage='NonSudo'
                     else
                          prevelage='Sudo'
                     fi
		else
		      prevelage='NonSudo'
                fi
	fi
	name="$number $owner $line $status $prevelage"
	if [[ $name != '' ]]; then
		echo "$name" >> /home/AnsibleUser/$filename
	fi

         number=$((number+1))
	

done< $file

