#!/usr/bin/env python
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
    description = ("An extremely simple update tool for Linux Lite, not built "
                                           "for other distros yet."),
    platform = "Linux",
    license = "GPL2",
    scripts = ['liteupdater','liteupdatertray'],
    data_files = [('share/liteupdater',['README','AUTHORS','COPYING',]),('/usr/share/pixmaps', ['updates_ll.png','updates_avail.png','menu-icon.png'])]    
) 
