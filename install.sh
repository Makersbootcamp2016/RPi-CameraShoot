#!/bin/bash

apt update
apt install python-requests python-picamera git

# Enable Camera
set_config_var start_x 1 /boot/config.txt
CUR_GPU_MEM=$(get_config_var gpu_mem /boot/config.txt)
if [ -z "$CUR_GPU_MEM" ] || [ "$CUR_GPU_MEM" -lt 128 ]; then
  set_config_var gpu_mem 128 /boot/config.txt
fi
sed /boot/config.txt -i -e "s/^startx/#startx/"
sed /boot/config.txt -i -e "s/^fixup_file/#fixup_file/"

# Clone
cd /home/pi
rm -R RPi-CameraShoot
git clone https://github.com/Makersbootcamp2016/RPi-CameraShoot.git
chown pi:pi -R RPi-CameraShoot

# Autostart

