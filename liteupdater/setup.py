#!/usr/bin/env python2
#
#       setup.py
#       

from distutils.core import setup

setup(name = "liteupdater",
    version = "0.1",
    description = "update notifications",
    author = "John Jenkins",
    author_email = "twodopeshaggy@gmail.com",
    url = "http://linuxliteos.com",
    license = "GPL2",
    scripts = ['liteupdater','liteupdatertray'],
    data_files = [('share/liteupdater',['README','AUTHORS','COPYING',]),('/usr/share/pixmaps', ['updates_ll.png','updates_avail.png','menu-icon.png'])]    
) 
