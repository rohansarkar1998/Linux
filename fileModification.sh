#!/bin/bash
str=$(ls -lah /home/osboxes/RemoveUser/users)
IFS=" "
modification=''
read -ra permission <<< $str
prevelage=${permission[0]}
owner=${permission[2]}
group=${permission[3]}
date=${permission[5]}
month=${permission[6]}
year=${permission[7]}
modification=$prevelage" "$owner" "$group" "$date" "$month" "$year
echo $modification


