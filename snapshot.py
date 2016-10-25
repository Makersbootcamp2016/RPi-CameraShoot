#!/usr/bin/python

import picamera
import requests
from time import sleep

camera = picamera.PiCamera()

while(True):
	camera.capture('snapshot.jpg')
	send = requests.post('https://honeypot-proto.herokuapp.com/snapshot', files={'image': open('snapshot.jpg', 'rb')})
	print(send.text)
	sleep(3)
