#!/bin/bash
# Script to check for pae capability, and then to install a pae kernel.
# Author: John 'ShaggyTwoDope' Jenkins
# Contributor: Jerry Bezencon

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[92m"` #Light Green
    NUMBER=`echo "\033[97m"` #White
    FGRED=`echo "\033[41m"` #Red
    WHITE_TEXT=`echo "\033[97m"` #White
    ENTER_LINE=`echo "\033[92m"` #Light Green
    CHECKPAE=$(
    if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
     echo "${WHITE_TEXT}Your Processor is ${NUMBER}NOT PAE ${MENU}capable, please press Enter to exit."; 
                                else
     echo "${MENU}Your Processor is ${NUMBER}PAE ${MENU}capable, you can procede with installation.${NORMAL}";
     echo ""
     echo "${NUMBER}Once you have installed and rebooted into the new kernel,${NORMAL}";
     echo "${NUMBER}you will need to install your drivers again to work with the PAE Kernel.${NORMAL}";
     echo ""
     echo "${NUMBER}When you reboot you will have a boot Menu, select ${MENU}Previous Linux versions${NORMAL}";
     echo "${NUMBER}then the new PAE kernel.${NORMAL}";
                              fi
      )
    echo -e "${CHECKPAE}"
    echo ""
    echo -e "${MENU}**************************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Read More (This will launch the Help Manual) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Install the ${NUMBER}PAE ${MENU}Kernel ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Reboot into the new kernel ${NORMAL}"
    echo -e "${MENU}**************************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please choose a menu option then press Enter or press ${WHITE_TEXT}Enter now to exit.${NORMAL}"
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
        option_picked "Launching Firefox with Help Manual...";
    firefox file:///usr/share/doc/xfce4-utils/html/C/install.html#updates &> /dev/null;
    	clear;
	show_menu;
        ;;



        2) clear;
            option_picked "PAE Kernel Installation Selected...";
              if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
                     echo "You cannot install the PAE Kernel as your processor appears not to support it."; 
                       else
                          sudo apt-get install linux-generic-pae linux-headers-generic-pae -y
				sudo sed -i "s/GRUB_DEFAULT=0/GRUB_DEFAULT=10/g" /etc/default/grub
				sudo sed -i "s/GRUB_HIDDEN_TIMEOUT=0/#GRUB_HIDDEN_TIMEOUT=0/g" /etc/default/grub
				sudo sed -i "s/GRUB_HIDDEN_TIMEOUT_QUIET=true/#GRUB_HIDDEN_TIMEOUT_QUIET=true/g" /etc/default/grub
					sudo update-grub2
                                fi

            clear;
            show_menu;
            ;;


        3) clear;
            option_picked "Reboot Selected";
            sudo shutdown -r now;
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
