#! /bin/sh

PAENO="Linux Lite PAE Installer
----------------------------------------------------------------------------------------
This will Check and install a PAE kernel for you.
YOU SUCK, GO AWAY
----------------------------------------------------------------------------------------
Click on OK to Close this prompt."


PAEYES="Linux Lite PAE Installer
----------------------------------------------------------------------------------------
This will Check and install a PAE kernel for you.
YOU SUCK, GO AWAY, ALSO THIS IS THE POSITIVE DIALOG.
----------------------------------------------------------------------------------------
Click on Yes to continue."


REBOOT="Linux Lite PAE Installer
----------------------------------------------------------------------------------------
You Gotta Reboot Yeah boy.
YOU SUCK, GO AWAY
----------------------------------------------------------------------------------------
Click on Yes to continue."


CHECKPAE=$(
    if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
     echo "Your Processor is NOT PAE capable, Unable to proceed."; 
else
     echo "Your Processor is PAE capable, you can proceed with installation.";
fi
)


CHECKPAEMASTER=$(
if [ -z "(grep -w pae /proc/cpuinfo)" ]; then

NOPROCEED=$(zenity --erro --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite PAE installer" --text "${PAENO}\n${CHECKPAE}"; echo $?)
if [ ${NOPROCEED} -eq 0 ]; then
	exit;
fi

          else

PROCEED=$(zenity --question --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite PAE installer" --text "${PAEYES}\n${CHECKPAE}"; echo $?)
if [ ${PROCEED} -eq 1 ]; then
	exit;
fi
   (sudo apt-get install linux-generic-pae linux-headers-generic-pae -y) | zenity --progress --pulsate --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite PAE installer" --text "Installing PAE Kernel..." --auto-close

REBOOTDIALOG=$(zenity --question --width=400 --height=80 --window-icon=/usr/share/pixmaps/menu-icon.png --title "Linux Lite Reboot" --text "${REBOOT}"; echo $?)
if [ ${REBOOTDIALOG} -eq 1 ]; then
	exit;
fi

sudo reboot

fi
)


