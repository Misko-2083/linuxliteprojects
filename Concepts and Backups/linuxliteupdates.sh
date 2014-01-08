#! /bin/sh

INSTALLER_TITLE="Linux Lite System Updater
----------------------------------------------------------------------------------------
This will Check and install any available updates for the manual and system.

When you click on Yes, this window will close and the install will begin.
The install time will vary based on your internet connection.
Support is available if you run into issues at http://linuxliteos.com/bugs or something.
----------------------------------------------------------------------------------------
Click on Yes to continue."

if ! $(zenity --question --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite Update" --text "${INSTALLER_TITLE}") ; then
   echo No ; else
   (sudo wget https://github.com/valtam/linuxlite_manual/archive/master.zip
sudo unzip master.zip
sudo rsync -avz linuxlite_manual-master/ /usr/share/doc/xfce4-utils/html
sudo rm -rf master.zip
sudo rm -rf linuxlite_manual-master/) | zenity --progress --pulsate --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite Update" --text "Updating Manual with new content,\nBe sure to check manual for new features and help." --auto-close
   (sudo apt-get update) | zenity --progress --pulsate --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite Update" --text "Updating repositories..." --auto-close
   (sudo apt-get -q=9 upgrade) | zenity --progress --pulsate --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite Update" --text "Performing updates..." --auto-close

fi





