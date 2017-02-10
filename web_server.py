#!/usr/bin/env python

from bottle import route, run, template, error, static_file
import glob
import os

TITLE = "Sophie's Secret Garden"
CAPTION = "How does your garden grow?"
file_path = "/home/pi/sophies_garden/pictures/"


@route('/static/<filename>')
def server_static(filename):
    #Serve static webfiles (css, favicon, etc)
    return static_file(filename, root='/home/pi/sophies_garden/static')

@route('/pictures/<filename>')
def picture_statics(filename):
    #Serve the pictures from the webcam
    return static_file(filename, root='/home/pi/sophies_garden/pictures')


def getint(file_obj):
    #Function to sort the file objects in reverse order
    basename = file_obj.name.split('/')[-1][:-4]
    return -int(basename)


@route('/')
def index():
    #Grab all the files so we can sort them
    pic_files = pictures=[open(_) for _ in glob.glob("{}*.jpg".format(file_path))]
    pic_files.sort(key=getint)

    #Return the html from template. Pass in the last 10 images
    return (
        template('header', title=TITLE, caption=CAPTION) +
        template('index', title=TITLE, caption=CAPTION, pictures=pic_files[:10])
        )


@route('/what-it-is')
def what():
    #Return the html from template
    return (
        template('header', title=TITLE, caption=CAPTION) +
        template('what')
        )


@error(404)
@error(500)
def error(error):
    #Return the html from template
    return (
        template('header', title=TITLE, caption=CAPTION) +
        template('error', code=error.status_code)
        )

#Start the webserver
run(host='0.0.0.0', port=80, debug=True)
