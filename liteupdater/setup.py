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
    license = "GPL2",
    scripts = ['liteupdater','liteupdatertray'],
    data_files = [('share/liteupdater',['README','AUTHORS','COPYING','updates_ll','updates_avail.png'])]    
) 
