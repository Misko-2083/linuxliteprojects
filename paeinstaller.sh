#!/bin/bash
# Script to check for pae capability, and then to install a pae kernel.
# Author: John 'ShaggyTwoDope' Jenkins 
# Credits: Jerry Bezencon The Cleaner and Editor , Stripe The Tester

show_menu(){
    NORMAL=`tput sgr0`
    MENU=`tput sgr0`
    BOLD=`tput bold`
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    CHECKPAE=$(
    if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
     echo "${RED_TEXT}Your Processor is NOT PAE capable, please press Enter to exit."; 
                                else
     echo "${MENU}Your Processor is PAE capable, you can procede with installation.${NORMAL}";
                              fi
      )

    echo -e "${CHECKPAE}"
    echo -e "${BOLD}**************************************************"
    echo -e "Linux Lite - PAE Kernel Installer"
    echo -e "${BOLD}**************************************************${NORMAL}"
    echo -e "${MENU}** 1)${MENU} Read More (This will launch the Help Manual) ${NORMAL}"
    echo -e "${MENU}** 2)${MENU} Install the PAE Kernel ${NORMAL}"
    echo -e "${MENU}** 3)${MENU} Reboot into the new kernel ${NORMAL}"
    echo -e "${MENU}**************************************************${NORMAL}"
    echo -e "${MENU}Please choose a menu option then press Enter or press ${RED_TEXT}Enter now to exit.${NORMAL}"
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

