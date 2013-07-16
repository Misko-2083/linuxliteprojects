#!/bin/bash
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
# Script to check for pae capability, and then to install a pae kernel.
# Author: John 'ShaggyTwoDope' Jenkins 
# Credits: Jerry Bezencon The Cleaner and Editor , Stripe The Tester

show_menu(){
    MENU=`tput sgr0`
    BOLD=`tput bold`
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    CHECKPAE=$(
    if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
     echo "${RED_TEXT}Your Processor is NOT PAE capable, please press Enter to exit."; 
                                else
     echo "${MENU}Your Processor is PAE capable, you can proceed with installation.";
                              fi
      )

    echo -e "${CHECKPAE}"
    echo -e "${BOLD}**************************************************"
    echo -e "${BOLD}Linux Lite - PAE Kernel Installer"
    echo -e "${BOLD}**************************************************"
    echo -e "${MENU}** 1) Read More (This will launch the Help Manual)"
    echo -e "${MENU}** 2) Install the PAE Kernel"
    echo -e "${MENU}** 3) Reboot into the new kernel"
    echo -e "${MENU}**************************************************"
    echo -e "${MENU}Please choose a menu option then press Enter or press ${RED_TEXT}Enter now to exit.${MENU}"
    read opt
}

function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: No message passed"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}

clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "Launched Browser with Help Manual";
    firefox https://www.linuxliteos.com/manual/install.html#updates &
    show_menu;
        ;;

        2) clear;
            option_picked "Installation Selected";
              if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
                     echo "You cannot install the PAE Kernel as your processor appears not to support it."; 
                       else
                          sudo apt-get install linux-generic-pae linux-headers-generic-pae -y
                                fi
            show_menu;
            ;;

        3) clear;
            option_picked "Reboot Selected";
            ls -art;
            show_menu;
            ;;

        x)exit;
        ;;

        \n)exit;
        ;;

        *)clear;
        option_picked "You must choose a listed option, or press Enter to exit.";
        show_menu;
        ;;
    esac
fi
done

