#!/usr/bin/env python2
#  
#
#  Copyright 2013 Johnathan "ShaggyTwoDope" Jenkins <twodopeshaggy@gmail.com>
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#
#  todo: better dialog for missing commands?, one check at a time insane

zoose_icons=[
["name","icon","command"],
["Mouse&Keyboard","input-mouse",'firefox'],
["Set Wallpaper","background",'firefox'],
["Screensaver Settings","xscreensaver",'xscreensaver-demo'],
["Appearance","preferences-desktop-theme",'firefox'],
["Install Software","package-manager-icon",'package-manager'],
["Session Settings","gnome-window-manager",'firefox'],
["Monitor Settings","computer",'firefo'],
]


import os
import sys
import string
import pygtk
pygtk.require('2.0')
import gtk
import codecs
import pango




class Startup:

    def destroy(self, widget, data=None):
        # zoose mode
        gtk.main_quit()


    def valtamaction(self, widget, event, data=None):
        if event.button==1:
           pathinfo=widget.get_path_at_pos(int(event.x),int(event.y)) 
           if pathinfo==None: return False
           pathnr=pathinfo[0]  
           command=self.liststore[pathnr][2]
           # special case for xscreensaver, if not found displays dialog
           if command=='xscreensaver-demo':
              if not os.path.exists('/usr/bin/xscreensaver-demo'):
                 dialog = gtk.MessageDialog(self.window, gtk.DIALOG_MODAL,gtk.MESSAGE_INFO,gtk.BUTTONS_OK, "apt-get install xscreensaver")
                 result = dialog.run()
                 dialog.destroy()
           os.system(command+' &') 
           return True
        return False


    def __init__(self):
        # create the window
        window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window=window
        window.set_title('Lite-Control-Center')
        window.connect("destroy", self.destroy)
        window.set_border_width(3)
        window.set_position(gtk.WIN_POS_CENTER_ALWAYS)
        # we make the icons
        it=gtk.icon_theme_get_default()
        gtk.window_set_default_icon(it.load_icon("gtk-preferences",48,gtk.ICON_LOOKUP_FORCE_SVG))
        window.resize(800,400)
        self.liststore=gtk.ListStore(gtk.gdk.Pixbuf,str,str)
        self.iv=gtk.IconView(self.liststore)
        self.iv.set_pixbuf_column(0)
        self.iv.set_text_column(1)
        self.iv.set_events(self.iv.get_events() | gtk.gdk.BUTTON_PRESS_MASK)
        self.iv.connect("button-press-event", self.valtamaction)
        sw = gtk.ScrolledWindow()
        sw.set_shadow_type(gtk.SHADOW_ETCHED_IN)
        sw.set_policy(gtk.POLICY_AUTOMATIC, gtk.POLICY_AUTOMATIC)
        sw.add(self.iv)
        window.add(sw)
        first=True
        for line in zoose_icons:
            if first:
               first=False
               continue  
            try:
               if '/' in line[1]:
                  pixbuf=gtk.gdk.pixbuf_new_from_file(line[1])
               else:
                  pixbuf=it.load_icon(line[1],48,gtk.ICON_LOOKUP_FORCE_SVG)
            except:
               pixbuf=it.load_icon('gtk-stop',48,gtk.ICON_LOOKUP_FORCE_SVG)
            namen=(line[0])
            self.liststore.append([ pixbuf,namen,line[2] ])
        window.show_all()


    def main(self):
        # Cliche init
        gtk.main()


# I swear zoose this better work
if __name__ == "__main__":

     app = Startup()
     app.main()
