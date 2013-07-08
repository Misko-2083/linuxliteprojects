#!/bin/bash

show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    CHECKPAE=$(if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
     echo "${RED_TEXT}Your Processor is NOT PAE Capable, Please Press enter to exit."; 
                                else
     echo "${MENU}Your Processor is PAE Capable, You can procede with installing.${NORMAL}";
                              fi
      )
    echo -e "${CHECKPAE}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Read More (This will launch the manual) ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2)${MENU} Install PAE Kernel ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)${MENU} Reboot into new kernel ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit.${NORMAL}"
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
        option_picked "Launched Browser with Manual";
        dwb https://www.linuxliteos.com/manual/install.html#updates &
    show_menu;
        ;;



        2) clear;
            option_picked "Installation Selected";
              if [ -z "(grep -w pae /proc/cpuinfo)" ]; then
                     echo "You can not install the PAE Kernel as your processor flags apear not to support it."; 
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
        option_picked "You must chose a listed option, or press enter to exit.";
        show_menu;
        ;;
    esac
fi
done

