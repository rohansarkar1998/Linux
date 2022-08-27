#!/bin/bash
str=$(systemctl status httpd | grep 'active')
time=$(date)
echo $str
echo $time
substring='inactive'
if [[ "$str" == *"$substring"* ]]; then
   echo "Service Down"
else
    echo "Service Up"
fi

