#!/bin/bash

file='/etc/shadow'
file1='/etc/passwd'
usersName=()
rootUses=()
while read line
do
	str="$line"
	IFS=":"
	read -ra roots <<< "$str"
	name=${roots[0]}
	uid=${roots[2]}
	gid=${roots[3]}
	if [[ $uid -ge 1000 && $gid -ge 1000 && "$name" != "*nobody*" ]]
	then
		#echo "$name"
		rootUses+=($name)
	fi
	
done<$file1
	
while read line
do
	str="$line"
	IFS=":"
	read -ra users <<< "$str"
	name=${users[0]}
	temp=${users[1]}
        if [[ "$temp" == "!!" && "${rootUses[@]}" =~ "${name}" ]]
	then
		#echo "$name"
		usersName+=($name)
	fi
done<$file
rm /home/osboxes/Hello/passwordlessuser2
num=${#usersName[@]}
echo "${num}"
i=0
while [ $i -lt $num ]
do
	user=${usersName[i]}
	echo $user >>/home/osboxes/Hello/passwordlessuser2
	
	i=$((i+1))
done

echo "Hiiii"

#MASSAGEBODY="Hi Team,
#			This following users not have a password in there account. So according 
#to corporate police we want to remove this user accounts. We want approvel for this activity.
#If the account need for business please inform us , we will provide a temporary password but 
#please suggest him or her to create a strong password.The users name are in this below files 

#Thanks
#Rohan"
#MASSAGEBODY="KJBNB,M J"
#SMTPFROM=rohansarkarmsit@gmail.com
#SMTPTO=rohan.mili.98@gmail.com
#SMTPSERVER=smtp.googlemail.com:587
#SMTPUSER=rohansarkarmsit
#SMTPPASS=9474497622
#SUBJECT="Remove the accounts that does not have a password"
#ATTACHMENT='/home/osboxes/Test/passwordlessuser2'

echo "HIII2"



#sendemail -f $SMTPFROM -t $SMTPTO  -u $SUBJECT -m $MASSAGEBODY -a $ATTACHMENT -s $SMTPSERVER -xu $SMTPUSER -xp $SMTPPASS



