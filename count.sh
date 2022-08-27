#!/bin/bash
val=$(grep -c "Rohan" /etc/sudoers)
echo "$val" >> /home/AnsibleUser/teting1
