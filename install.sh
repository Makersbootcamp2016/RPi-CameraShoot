#!/bin/bash

sudo apt update
sudo apt install python-requests python-picamera git

echo ""
echo "Don't forget to enable the camera with raspi-config, and add the script to /etc/rc.local"

