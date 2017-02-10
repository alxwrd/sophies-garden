#!/usr/bin/env python

import pygame
import pygame.camera
import glob

file_path = "/home/pi/sophies_garden/pictures/"

#Grab an image from the camera
pygame.camera.init()
cam = pygame.camera.Camera("/dev/video0", (1280, 720))
cam.start()
img = cam.get_image()

#Sort the exisiting images
file_list = [_ for _ in glob.glob("{}*.jpg".format(file_path))]
file_list.sort()

if not file_list:
    #If there are no exisiting images, create the first
    pygame.image.save(img, "{}000000.jpg".format(file_path))
else:
    #If the are some images, grab the number of the last one, and save the
    # next in the sequence
    last_file = int(file_list[-1].split("/")[-1][:-4])
    pygame.image.save(img, "{}{:06d}.jpg".format(file_path, last_file + 1))
