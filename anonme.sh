#!/bin/bash
#script to: randomize mac address, and start anonsurf proxy

sudo ifconfig wlo1 down
sudo macchanger -r wlo1
sudo ifconfig wlo1 up
sudo service network-manager restart
sudo anonsurf start > /dev/null 2>&1
sudo anonsurf restart
