#!/bin/bash
lastb  >> /home/osboxes/Hello/badlogs
file='/home/osboxes/Hello/badlogs'
sed '$d'/home/osboxes/Hello/badlogs
temp=()
BadLogins=()
while read line
do
	str="$line"
	IFS=" "
	read -ra logins <<< "$str"
       	#newstr=${logins[0]}" "${logins[1]}" "${logins[3]}
	val=${logins[1]}
	if [[ "$val" == *"ssh"* ]]; then
		val="ssh"
	else
		val="root"
	fi
	newstr=${logins[0]}" "${logins[4]}" "${logins[5]}" "${val}	
	temp+=("$newstr")
	
done< $file

num=${#temp[@]}
i=0
while [ $i -lt $num ]
do
	count=0
	user=${temp[i]}
	if [[ ! "${BadLogins[*]}" =~ "${user}" ]];then
		j=0
		while [ $j -lt $num ]
		do
			tempUser=${temp[j]}
			if [[ "$tempUser" == "$user" ]]; then
				count=$((count+1))
			fi
			j=$((j+1))
			BadLogins+=("$user")
		done
		echo "$user $count"
	fi
	

	i=$((i+1))
done



