#!/bin/bash
################################################################################
######################### FUNCTIONS ############################################
################################################################################

#   -------------------------------
#   MASTER FUNCTION
#   -------------------------------

function master() {
    clear && echo
    echo "    x  | exit              | Exit"
    echo "    1  | linx              | Linux Managemet"
    echo "    2  | win               | Windows Managemet"
    echo "    3  | manage            | System Management"
    echo "    4  | mywork            | Daily Work"
    echo "    5  | apps              | My Programs"
    echo

    function helper() {
        read -e -p "Function? (№/name) : " input
        case $input in
            1|linx)     linx ;;
            2|win)      win ;;
            3|manage)   manage ;;
            4|mywork)   mywork ;;
            5|apps)     apps ;;
            x|exit)  : && clear ;;
            *)          helper ;;
        esac
    }

    read -p "Press enter to continue"
    helper
}

#   -------------------------------
#   LINUX MANAGEMET
#   -------------------------------

function mkd() {
    mkdir -p "$@" && cd "$_";
}

function filec() {
    if [ -z $1 ] ; then
        raw=$(ls -l | wc -l)
        num=$(echo $raw | awk '{ print $NF}')
        echo "$num - 1" | bc
    else
        case $1 in
            a|all)
                raw=$(ls -al | wc -l)
                num=$(echo $raw | awk '{ print $NF}')
                echo "$num - 3" | bc ;;
            *)  echo && echo "DESCRIPTION"
                echo "        filec - list number of files in a directory" && echo
                echo "SYNTAX"
                echo "        filc [OPTION]" && echo
                echo "OPTIONS"
                echo "        a, all"
                echo "              include hidden" && echo ;;
        esac
    fi
}

function linx() {
    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:'
        echo    '       x  | Exit'
        echo -e '       b  | Go Back\n'
        echo    "    1  | xsession            | Launch X Sessions"
        echo    "    2  | mkd                 | Create a New Directory and enter it"
        echo    "    3  | ssh_manage          | SSH Managemet"
        echo    "    4  | gpg_manage          | GPG Managemet"
        echo    "    5  | dots                | Update .dotfiles"
        echo -e "    6  | glb                 | List Git Branches\n"
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
        input2=$2
    fi

    function xsession (){

        path2="C:\Users\Todorov\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\todorov\.dotfiles\wsl\vcxsrv\\"
        path="C:\Program Files\VcXsrv"
        win32="C:\Windows\System32"

        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo    '       1  | Launch Xfce4 Session'
            echo    '       2  | Launch i3-wm Session'
            echo -e '       3  | Load X Server in Multi Window mode\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        case $input in
            1)
                echo -e "\n Launching xfce4....\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                cmd.exe /c start /D "$path" /MAX "$path2"configNormal.xlaunch && sudo xfce4-session ;;
                # cmd.exe /c start /D "$win32" bash.exe --login -c "sudo xfce4-session"
                # sudo chown -v $USER ~/.ICEauthority
            2)
                echo -e "\n Launching i3-wm....\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                cmd.exe /c start /D "$path" /MAX "$path2"configNormal.xlaunch && sudo i3 ;;
                # cmd.exe /c start /D "$win32" bash.exe --login -c "sudo i3"
            3)
                echo -e "\n Loading X Server in Multi Window mode....\n"
                cmd.exe /c start /D "$path" /MAX "$path2"configMultiWindow.xlaunch ;;
            b)  linx ;;
            x)  : && clear ;;
            *)  xsession ;;
        esac
    }

    # List Git Branches sorted by recent updates, adding a star to remote tracking branches
    function glb() {
      RED="\e[91m";
      for branch in $(git branch | sed s/^..//); do
        time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
        # Add a red star to mark branches that are tracking something upstream
        tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
        printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
      done | sort;
    }

    function ssh_manage() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo -e '       b  | Go Back\n'
        echo    '       1  | Generate a Key'
        echo    '       2  | Manage Permissions'
        echo    '       3  | Copy Public Key (Windows)'
        echo    '       4  | Copy Public Key (Linux)'
        echo    '       5  | Copy Public Key to Remote'
        echo    '       6  | Edit User Config'
        echo    '       7  | Edit OpenSSH Config'
        echo    '       8  | Backup'
        echo -e '       9  | Update\n'
        read -e -p "  Enter Option: " input
        echo

        function ssh_permissons() {
            sudo chmod -v 600 ~/.ssh/*
            sudo chmod -v 700 ~/.ssh
            sudo chown -Rv $USER ~/.ssh/
        }

        case $input in
            1)
                read -e -p "  Enter Comment (Mail): " comment
                read -e -p "  Enter File Name: " output_file
                ssh-keygen -b 4096 -t rsa -C "$comment" -f "$output_file" ;;
            2)
                ssh_permissons ;;
            3)
                ls ~/.ssh/ | grep .pub && echo
                read -e -p "  Enter Public Key to Copy: " pub_key
                echo && cat ~/.ssh/"$pub_key" && echo
                cat ~/.ssh/"$pub_key" | cmd.exe /c clip ;;
            4)
                ls ~/.ssh/ | grep .pub && echo
                read -e -p "  Enter Public Key to Copy: " pub_key
                echo && cat ~/.ssh/"$pub_key" && echo
                xclip -sel clip < ~/.ssh/"$pub_key" ;;
            5)
                ls ~/.ssh/ | grep .pub && echo
                read -e -p "  Enter Remote Server: " remote
                read -e -p "  Enter Public Key to Copy: " pub_key
                echo && cat ~/.ssh/"$pub_key" && echo
                cat ~/.ssh/"$pub_key" | ssh "$remote" "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys";;
            6)
                sudo vim ~/.ssh/config ;;
            7)
                sudo vim /etc/ssh/sshd_config
                sudo service ssh restart ;;
            8)
                sudo cp -r ~/.ssh/* /mnt/d/Workspace/Projects/Programing/Web/Protocols/Application\ Layer/SSH/Backup/.ssh/ ;;
            9)
                sudo cp -r /mnt/d/Workspace/Projects/Programing/Web/Protocols/Application\ Layer/SSH/Backup/.ssh/* ~/.ssh/
                ssh_permissons ;;
            b)
                linx ;;
            x)
                : && clear ;;
            *)
                ssh_manage ;;
        esac
    }

    function gpg_manage() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x   | Exit'
        echo -e '       b   | Go Back\n'
        echo    '       1   | Generate a Key'
        echo    '       2   | Import'
        echo    '       3   | Export'
        echo    '       4   | Revoke'
        echo    '       5   | List'
        echo    '       6   | Delete'
        echo    '       7   | Edit'
        echo    '       8   | Sign'
        echo    '       9   | Encrypt'
        echo -e '       10  | Decrypt\n'
        read -e -p "  Enter Option: " input
        echo

        function list(){
            clear && echo -e '\n   >>> Public Key Ring\n'
            sudo gpg --list-keys --with-fingerprint
            sudo gpg --list-keys --with-colons --with-fingerprint
            echo -e '\n   >>> Secret Key Ring\n'
            sudo gpg --list-secret-keys --with-fingerprint
            sudo gpg --list-secret-keys --with-colons --with-fingerprint
            echo
        }

        function import_key(){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo    '       1  | Import Key Pair'
            echo    '       2  | Import Public Key'
            echo -e '       3  | Import Private Key\n'
            read -e -p "  Enter Option: " input
            echo

            case $input in
                1)
                    clear
                    read -e -p "  Enter Path to Key: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    sudo gpg --import "$path$key.pub.asc"
                    sudo gpg --import "$path$key.sec.asc" ;;
                2)
                    clear
                    read -e -p "  Enter Path to Key: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    sudo gpg --import "$path$key.pub.asc" ;;
                3)
                    clear
                    read -e -p "  Enter Path to Key: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    sudo gpg --import "$path$key.sec.asc" ;;
                b)
                    gpg_manage ;;
                x)
                    : && clear ;;
                *)
                    import_key ;;
            esac
            # # import form keybase
            # curl https://keybase.io/mlvnt/pgp_keys.asc | gpg --import
        }

        function export_key(){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo -e '    Export To a File\n'
            echo    '       1  | Key Pair'
            echo    '       2  | Public Key'
            echo    '       3  | Private Key'
            echo -e '    Export To the Clipbard\n'
            echo    '       4  | Public Key'
            echo -e '       5  | Private Key\n'
            read -e -p "  Enter Option: " input
            echo

            case $input in
                1)
                    clear && list
                    read -e -p "  Enter Path to Save: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg -o "$path$key.pub.asc" --export -a "$uid"
                    sudo gpg -o "$path$key.sec.asc" --export-secret-key -a "$uid" ;;
                2)
                    clear && list
                    read -e -p "  Enter Path to Save: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg -o "$path$key.pub.asc" --export -a "$uid" ;;
                3)
                    clear && list
                    read -e -p "  Enter Path to Save: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg -o "$path$key.sec.asc" --export-secret-key -a "$uid" ;;
                4)
                    clear && list
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --export -a "$uid"
                    sudo gpg --export -a "$uid" | cmd.exe /c clip ;;
                5)
                    clear && list
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --export-secret-key -a "$uid"
                    sudo gpg --export-secret-key -a "$uid" | cmd.exe /c clip ;;
                b)
                    gpg_manage ;;
                x)
                    : && clear ;;
                *)
                    export_key ;;
            esac
            # # export using fingerprint
            # gpg --export -a A4AA3A5BDBD40EA549CABAF9FBC07D6A97016CB3
        }

        function delete_key(){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo    '       1  | Delete Key Pair'
            echo    '       2  | Delete Public Key'
            echo -e '       3  | Delete Private Key\n'
            read -e -p "  Enter Option: " input
            echo

            case $input in
                1)
                    clear
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --delete-key "$uid"
                    sudo gpg --delete-secret-key "$uid" ;;
                2)
                    clear
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --delete-key "$uid" ;;
                3)
                    clear
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --delete-secret-key "$uid" ;;
                b)
                    gpg_manage ;;
                x)
                    : && clear ;;
                *)
                    delete_key ;;
            esac
        }

        function revoke_key(){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo    '       1  | Generate'
            echo    '       2  | Import'
            echo -e '       3  | Revoke Key Pair\n'
            read -e -p "  Enter Option: " input
            echo

            case $input in
                1)
                    clear
                    read -e -p "  Enter Path to Save: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --output "$path$key.rev.asc" --gen-revoke "$uid"
                    echo && cat "$path$key.rev.asc" && echo ;;
                2)
                    clear
                    read -e -p "  Enter Path to Save: " path
                    read -e -p "  Enter Key Name (Filename): " key
                    sudo gpg --import "$path$key.rev.asc" ;;
                3)
                    clear
                    read -e -p "  Enter Key UID (User Name): " uid
                    sudo gpg --keyserver keyserver.ubuntu.com --send-key "$uid"
                    sudo gpg --keyserver keyserver.mozilla.org --send-key "$uid" ;;
                b)
                    gpg_manage ;;
                x)
                    : && clear ;;
                *)
                    revoke_key ;;
            esac
        }

        case $input in
            1)  sudo gpg --gen-key ;;
            2)  import_key ;;
            3)  export_key ;;
            4)  revoke_key ;;
            5)  list ;;
            6)  delete_key ;;
            7)
                 ;;
            8)
                 ;;
            9)
                 ;;
            b)  linx ;;
            x)  : && clear ;;
            *)  gpg_manage ;;
        esac
    }

    case $input in
        1|xsession)    xsession ;;
        2|mkd)         mkd ;;
        3|ssh_manage)  ssh_manage ;;
        4|gpg_manage)  gpg_manage ;;
        5|dots)        dots ;;
        6|glb)         glb ;;
        b)  master ;;
        x)  : && clear ;;
        *)  linx ;;
    esac
}

#   -------------------------------
#   SYSTEM MANAGEMENT
#   -------------------------------

function manage(){
    clear
    echo -e '\n  Available Options:'
    echo    '       x  | Exit'
    echo -e '       b  | Go Back\n'
    echo    "    1  | bin                 | Manage the Trash"
    echo    "    2  | move                | Move, Copy"
    echo    "    3  | links               | Manage Links"
    echo -e "    4  | handles             | Manage File Handles / Descriptors\n"
    read -e -p "  Enter Option: " input
    echo

    case $input in
        1|bin)      bin ;;
        2|move)     move ;;
        3|links)    links ;;
        4|handles)  handles ;;
        b)  master ;;
        x) : && clear ;;
        *) manage ;;
    esac
}

#   -------------------------------
#   INOTIFY
#   -------------------------------

function watching(){
    dirs="$1"
    files="$2"
    shift 2
    echo
    echo "[watching] { $dirs } for changes of { $files }"
    echo "[executing] " "{ $@ }" " in case of matching event"
    echo

    when-changed -vr "$dirs/$files" echo "MODIFY" | sed -u '1~2d' |
    while read -r events; do
        echo "[when-changed] " $events $files
        echo
        echo "[executing] " "$@"
        "$@"
        echo
    done

    echo "loop reading from { when-changed } finished with status $?"
}

function lin(){
    cd '/mnt/d/Workspace/Shared/mobile/config/apps/notes/markor'
    watching . linkbox.txt '/mnt/d/Workspace/Projects/Programing/Scripts/Python/Web/links.py'
}

function pas(){
    cd '/mnt/d/Workspace/Tech/Sandwich'
    watching . p.kdbx cp p.kdbx /mnt/d/Workspace/Shared/mobile/config/apps/notes/p
}

#   -------------------------------
#   Empty Trash
#   -------------------------------

function bin (){
    patht="D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe"
    trashdir=~/.local/share/Trash

    function list() {
        clear && echo
        echo    '         x | Exit'
        echo    '         b | Go Back'
        echo    '         1 | List All'
        echo -e '         2 | Search For\n'
        read -e -p "  Option: " input
        case $input in
            1)
                echo && sudo trash-list && echo ;;
            2)
                read -e -p "  Search For: " search
                echo && sudo trash-list | grep -i $search && echo ;;
            b)  bin ;;
            x)  : && clear ;;
            *)  list ;;
        esac
    }

    function empty() {
        clear && echo && sudo trash-list && echo
        echo    '         x | Exit'
        echo    '         b | Go Back'
        echo    '         1 | Empty'
        echo -e '         2 | Remove Selected\n'
        read -e -p "  Option: " input
        case $input in
            1)
                sudo trash-empty
                echo && sudo trash-list && echo ;;
            2)
                read -e -p "  Delete: " search
                echo && sudo trash-rm $search && echo ;;
            b)  bin ;;
            x)  : && clear ;;
            *)  empty ;;
        esac
    }

    clear
    echo -e '\n  Available Options:\n'
    echo    '         x | Exit'
    echo    '         b | Go Back'
    echo    '       Windows:'
    echo    '         1 | Empty Bin'
    echo    '       Linux:'
    echo    '         2 | Trash'
    echo    '         3 | List'
    echo    '         4 | Empty'
    echo -e '         5 | Restore'
    echo -e '         6 | Trashdir\n'
    read -e -p "  Enter Option: " input
    echo

    case $input in
        1)
            echo -e '\n Empting $RECYCLE.BIN....\n'
            cmd.exe /c "$patht" emptybin ;;
            # cmd.exe /c 'D:\Portable Apps\By Category\File Management\Recycle\recycle.exe' /L
            # echo -e '\n Empting $RECYCLE.BIN on C:\ ....\n'
            # cmd.exe /c rd /s /q '%systemdrive%\$Recycle.bin'
            # echo -e '\n Empting $RECYCLE.BIN on D:\ ....\n'
            # cmd.exe /c rd /s /q 'D:\$Recycle.bin'
        2)
            ll && read -e -p "  What to trash: " rubish
            echo && sudo trash-put -v $rubish && echo ;;
        3)
            list;;
        4)
            empty;;
        5)
            clear && echo && sudo trash-restore && \
            echo && sudo trash-list && echo ;;
        6)
            cd $trashdir ;;
        b)  bin ;;
        x)  : && clear ;;
        *)  list ;;
    esac
}

#   -------------------------------
#   MANAGE LINKS
#   -------------------------------

function links (){
    # Delete Specified symbilic links
    function delsymb(){
    echo -e '\n Deleting Symbolic Links....\n'
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    find -type l -print | while IFS= read -r lnk
    do
      if readlink "$lnk" | grep '/mnt/' ; then
        rm "$lnk"
      fi
    done
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo -e '\n Symbolic Links Deleted!\n'
    }

    path='/mnt/d/Workspace/Shared/mobile/notebook/~genLinks'
    pathwin='D:\Workspace\Shared\mobile\notebook\~genLinks'

    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x | Exit'
        echo    '           b | Go Back'
        echo    '       Generate Symbolic Links from a list:'
        echo    '           1 | Delete'
        echo    '           2 | Create Links for files'
        echo    '           3 | Create Links for folders'
        echo    '       Generate Symbolic Links:'
        echo    '         Linux:'
        echo    '           4 | Create'
        echo    '         Windows:'
        echo    '           5 | Create Link for Files'
        echo -e '           6 | Create Link for Directory\n'
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
    fi

    case $input in
        1)
            cd $path && delsymb ;;
        2)
            cd $path && delsymb
            python3 .symb.py && open $pathwin ;;
        3)
            cd $path && delsymb
            python3 .symbf.py && open $pathwin ;;
        4)
            read -e -p "    Enter Target: " target
            read -e -p "    Enter Link Name: " linkname
            echo -e '\n Creating symblink '$linkname' to '$target'\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            ln -sv $target $linkname
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Link Created!\n' ;;
        5)
            read -e -p "    Enter Target: " -r target
            read -e -p "    Enter Link Name: " -r linkname
            echo -e '\n Creating symblink '$linkname' to '$target'\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            # lnk='cmd.exe /c mklink'
            cmd.exe /c mklink $linkname $target
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Link Created!\n' ;;
        6)
            read -e -p "    Enter Target: " -r target
            read -e -p "    Enter Link Name: " -r linkname
            echo -e '\n Creating symblink '$linkname' to '$target'\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            cmd.exe /c mklink /D $linkname $target
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Link Created!\n' ;;
        b)  manage ;;
        x)  : && clear ;;
        *)  links ;;
    esac
}

#   -------------------------------
#   MOVE, COPY
#   -------------------------------

function move (){
    function main_backup() {
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Normal'
        echo    '           2  | Mirroring'
        echo    '           3  | Dry-Run Normal'
        echo -e '           4  | Dry-Run Mirroring\n'
        read -e -p "  Option: " input

        excludeddir="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded"
        animemain="/mnt/e/B/backup/Anime/Current Season/~MAIN/"
        dotfilesdird="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
        dotfilesdire="/mnt/e/B/backup/Workspace/Projects/Programing/Git/dotfiles/.dotfiles"
        drived="/mnt/d/"
        bakcupdire="/mnt/e/B/backup"
        logdir="/mnt/e/B/backup_logs/"
        logfile="log_backup-$(date "+%Y-%m-%d-%H-%M").txt"
        workspacedird="D:\Workspace"
        workspacedire="E:\B\backup\Workspace"
        link_dir_1="/mnt/e/B/backup/Workspace"
        link_dir_2="/mnt/e/B/backup/Workspace/Shared"

        case $input in
            1|3) robonorm="/E" && rsyncnorm='' ;;
            2|4) robonorm="/E /PURGE" && rsyncnorm="--delete " ;;
        esac

        case $input in
            1|2) robocopyoptions=""$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
                 ryncoptions="-avhzH --progress --stats "$rsyncnorm"" ;;
            3|4) robocopyoptions="/L "$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
                 ryncoptions="-avhzH --progress --stats --dry-run "$rsyncnorm"" ;;
        esac

        case $input in 
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    function backups () {
                        mkdir -p "$animemain"
                        # #######################################################################################################
                        sudo rsync $ryncoptions --exclude-from="$excludeddir" "$drived" "$bakcupdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        #######################################################################################################
                        case $input in
                            1|2) find "$link_dir_1" "$link_dir_2" -type l -print0 | xargs -0 rm -v -- ;;
                            3|4) find "$link_dir_1" "$link_dir_2" -type l ;;
                        esac
                        cmd.exe /c robocopy "$workspacedird" "$workspacedire" "*" $robocopyoptions
                        # CHCP 1251
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    function main_clone() {
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo -e '           1  | Proceed\n'
        read -e -p "  Option: " input

        case $input in 
            1)
                    echo
                    read -e -p "  Enter Drive Letter/Path [c]:" backdir
                    dotfilesdird="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
                    dotfilesdire="/mnt/"$backdir"/Workspace/Projects/Programing/Git/dotfiles/.dotfiles"
                    drived="/mnt/d/"
                    drivedwin="D:\\"

                    robocopyoptions="/E /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
                    ryncoptions="-avhzH --progress --stats"

                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Main Drive.... ~~~~~~~~~~~~~~\n'
                    function clone () {
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        mkdir -p "/mnt/"$backdir"/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
                        sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        cmd.exe /c robocopy "$drivedwin" "$backdir:\\" "*" $robocopyoptions
                    }
                    clone 
                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Complete! ~~~~~~~~~~~~~~\n' 
                    ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    function main_restore() {
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Normal'
        echo    '           2  | Mirroring'
        echo    '           3  | Dry-Run Normal'
        echo -e '           4  | Dry-Run Mirroring\n'
        read -e -p "  Option: " input

        dotfilesdird="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles"
        dotfilesdire="/mnt/e/B/backup/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
        drived="/mnt/d"
        bakcupdire="/mnt/e/B/backup/"
        logdir="/mnt/e/B/restore_logs/"
        logfile="log_restore-$(date "+%Y-%m-%d-%H-%M").txt"
        workspacedird="D:\Workspace"
        workspacedire="E:\B\backup\Workspace"
        link_dir_1="/mnt/d/Workspace"
        link_dir_2="/mnt/d/Workspace/Shared"

        case $input in
            1|3) robonorm="/E" && rsyncnorm='' ;;
            2|4) robonorm="/E /PURGE" && rsyncnorm="--delete " ;;
        esac

        case $input in
            1|2) robocopyoptions=""$robonorm" /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
                 ryncoptions="-avhzH --progress --stats --ignore-times "$rsyncnorm"" ;;
            3|4) robocopyoptions="/L "$robonorm" /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
                 ryncoptions="-avhzH --progress --stats --ignore-times --dry-run "$rsyncnorm"" ;;
        esac

        case $input in 
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    function backups () {
                        sudo rsync $ryncoptions "$dotfilesdire" "$dotfilesdird"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        case $input in
                            1|2) find "$link_dir_1" "$link_dir_2" -type l -print0 | xargs -0 rm -v -- ;;
                            3|4) find "$link_dir_1" "$link_dir_2" -type l ;;
                        esac
                        cmd.exe /c robocopy "$workspacedire" "$workspacedird" "*" $robocopyoptions
                        # CHCP 1251
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    function mobile_backup() {
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Normal'
        echo    '           2  | Mirroring'
        echo    '           3  | Dry-Run Normal'
        echo -e '           4  | Dry-Run Mirroring\n'
        read -e -p "  Option: " input

        excludeddir="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded_mobile"
        sdcard=""
        bakcupdire="/mnt/e/B/backup_mobile/"
        logdir="/mnt/e/B/backup_logs/"
        logfile="log_backup-$(date "+%Y-%m-%d-%H-%M").txt"

        if [ $input -eq 1 ] || [ $input -eq 3 ] ; then 
            rsyncnorm=''
        elif [ $input -eq 2 ] || [ $input -eq 4 ] ; then 
            rsyncnorm="--delete "
        fi

        if [ $input -eq 3 ] || [ $input -eq 4 ] ; then
            ryncoptions="-avhzH --progress --stats --dry-run "$rsyncnorm""
        elif [ $input -eq 1 ] || [ $input -eq 2 ] ; then 
            ryncoptions="-avhzH --progress --stats "$rsyncnorm""
        fi

        if [ $input -eq 1 ] || [ $input -eq 2 ] || [ $input -eq 3 ] || [ $input -eq 4 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Backup Mobile SD Card.... ~~~~~~~~~~~~~~\n'
            mkdir -p "$logdir" && sudo touch "$logdir$logfile"

            function backups (){
                sudo rsync $ryncoptions --exclude-from="$excludeddir" "$sdcard" "$bakcupdire"
            }

            backups | sudo tee -ai "$logdir$logfile"
            echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n'
        elif [ $input == b ] ; then
            move
        elif [ $input == x ] ; then
            : && clear
        else
            mobile
        fi
    }

    function mobile_clone(){
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo -e '           1  | Proceed\n'
        read -e -p "  Option: " input

        case $input in 
            1)
                    echo
                    read -e -p "  Enter Drive Letter/Path [c]:" backdir
                    dotfilesdird="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
                    dotfilesdire="/mnt/"$backdir"/Workspace/Projects/Programing/Git/dotfiles"
                    drived="/mnt/e/B/backup_mobile/"
                    drivedwin="E:\\B\\backup_mobile"
                    ryncoptions="-avhzH --progress --stats"

                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Main Drive.... ~~~~~~~~~~~~~~\n'
                    function clone () {
                        sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                    }
                    clone 
                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Complete! ~~~~~~~~~~~~~~\n' 
                    ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    function mobile_restore(){
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Normal'
        echo    '           2  | Mirroring'
        echo    '           3  | Dry-Run Normal'
        echo -e '           4  | Dry-Run Mirroring\n'
        read -e -p "  Option: " input

        dotfilesdird="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles"
        dotfilesdire="/mnt/e/B/backup/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
        drived="/mnt/d"
        bakcupdire="/mnt/e/B/backup/"
        logdir="/mnt/e/B/restore_logs/"
        logfile="log_restore-$(date "+%Y-%m-%d-%H-%M").txt"
        workspacedird="D:\Workspace"
        workspacedire="E:\B\backup\Workspace"
        link_dir_1="/mnt/d/Workspace"
        link_dir_2="/mnt/d/Workspace/Shared"

        case $input in
            1|3) robonorm="/E" && rsyncnorm='' ;;
            2|4) robonorm="/E /PURGE" && rsyncnorm="--delete " ;;
        esac

        case $input in
            1|2) ryncoptions="-avhzH --progress --stats --ignore-times "$rsyncnorm"" ;;
            3|4) ryncoptions="-avhzH --progress --stats --ignore-times --dry-run "$rsyncnorm"" ;;
        esac

        case $input in 
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    function backups () {
                        sudo rsync $ryncoptions "$dotfilesdire" "$dotfilesdird"
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    function move_screenshots(){
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Anime Pics to Permanent Directory'
        echo    '           2  | Acer Screenshots to Permanent Directory'
        echo -e '           3  | Surface Screenshots to Permanent Directory\n'
        read -e -p "  Option: " input

        temp="/mnt/d/Workspace/~temp"
        screenshotsdir="/mnt/c/Users/Todorov/Pictures/My Screen Shots/"
        animepicsdir="/mnt/d/Workspace/Essential/Art/Screenshots/Pics"
        animepicsdirwin="D:\Workspace\Essential\Art\Screenshots\Pics"
        acerscreendir="/mnt/d/Workspace/Tech/Screenshots/Acer Predator G9-792"
        surfscreendir="/mnt/d/Workspace/Tech/Screenshots/Microsoft Surface Pro 4"

        case $input in
            1)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Anime Pics.... ~~~~~~~~~~~~~~\n'
                rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\[0-9\]*.PNG --exclude=\* "$screenshotsdir" "$animepicsdir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
                o "$animepicsdirwin" ;;
            2)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Acer Screenshots.... ~~~~~~~~~~~~~~\n'
                    rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$acerscreendir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n' ;;
            3)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Surface Screenshots.... ~~~~~~~~~~~~~~\n'
                rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$surfscreendir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n' ;;
            b)  move ;;
            x)  : && clear ;;
            *)  move_screenshots ;;
        esac
    }

    function move_all(){
        downloads="/mnt/c/Users/Todorov/Downloads/"
        documents="/mnt/c/Users/Todorov/Documents/"
        temp="/mnt/d/Workspace/~temp"

        echo -e '\n ~~~~~~~~~~~~~~ Moving from Downloads.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --exclude desktop.ini "$downloads" "$temp"
        find "$downloads" -depth -type d -empty -delete
        echo -e '\n ~~~~~~~~~~~~~~ Moving from Documents.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\*  "$documents" "$temp"
        echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} "$temp" \;
    }

    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '       Backup:'
        echo    '           1  | Main Drive'
        echo    '           2  | Mobile SD Card'
        echo    '       Restore:'
        echo    '           3  | Main Drive'
        echo    '           4  | Mobile SD Card'
        echo    '       Clone:'
        echo    '           5  | Main Drive'
        echo    '           6  | Mobile SD Card'
        echo    '       Move:'
        echo    '           7  | ALL from Windows Temporary Directories'
        echo -e '           8  | Screenshots\n'
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
        input2=$2
    fi

    case $input in
        1)  main_backup ;;
        2)  mobile_backup ;;
        3)  main_restore ;;
        4)  mobile_restore ;;
        5)  main_clone ;;
        6)  mobile_clone ;;
        7)  move_all ;;
        8)  move_screenshots ;;
        b)  manage ;;
        x)  : && clear ;;
        *)  move ;;
    esac
}

#   -------------------------------
#   UPDATE .DOTFILES
#   -------------------------------

function dots(){
    clear
    echo -e '\n  Available Options:'
    echo    '       x  | Exit'
    echo    '       b  | Go Back'
    echo    '       1  | Update'
    echo    '       2  | Update Clean'
    read -e -p "  Enter Option: " input
    echo
    if [ $input -eq 1 ] ; then
        dotfiles && gac
        cd ~/.dotfiles/ && git stash && gf
        cd ~/.dotfiles/wsl/ && sudo chmod -Rv +x ./*.sh ./bin/*
        sca && clear
    elif [ $input -eq 2 ] ; then
        echo -e '\n Removing old .dotfiles....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        sudo rm -rfv ~/.dotfiles 
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Cloning new .dotfiles....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/ ~/.dotfiles
        # oh-my-zsh
        sudo cp -rv /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/zsh/.oh-my-zsh ~/.dotfiles/wsl/shell/zsh/
        sudo cp -rv /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/.config/sublime-text-3 ~/.dotfiles/wsl/.config/
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Converting .dotfiles to LF endings....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        sudo dos2unix ~/.dotfiles/wsl/*.* ~/.dotfiles/wsl/shell/zsh/.* ~/.dotfiles/wsl/shell/zsh/.oh-my-zsh-custom/.* ~/.dotfiles/wsl/shell/bash/.* ~/.dotfiles/wsl/editors/.* ~/.dotfiles/wsl/git/.* ~/.dotfiles/wsl/git/*.* ~/.dotfiles/wsl/bin/*
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Sourcing .dotfiles....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        cd ~/.dotfiles/wsl/ && sudo chmod -Rv +x ./*.sh ./bin/*
        sca && clear
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Dotfiles Updated!\n'
    elif [ $input == b ] ; then
        linx
    elif [ $input == x ] ; then
        : && clear
    else
        dots
    fi
}

#   -------------------------------
#   MANAGE FILE HANDLES / DESCRIPTORS
#   -------------------------------

function handles(){
    cd /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SysinternalsSuite/Handle_sps
    clear
    echo -e '\n  Available Options:\n'
    echo    '           x  | Exit'
    echo    '           b  | Go Back'
    echo    '       Windows File Handles:'
    echo    '           1  | Show Handles for Particular Drive'
    echo    '           2  | Show All File Handles'
    echo    '           3  | Show All Process PIDs'
    echo    '           4  | Close Handles for Particular Drive'
    echo    '           5  | Help'
    echo    '       Linux File Handles'
    echo    '           6  | Show the number of All Open Descriptors'
    echo -e '           7  | Show All Descriptors\n'
    read -e -p "  Enter Option: " input
    echo
    if [ $input -eq 1 ] ; then
        read -e -p "    Enter Drive Letter: " input2
        echo -e '\n Showing Handles for '$input2':\....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        cmd.exe /c 'handle.exe' | grep ''$input2':\\'
        # cmd.exe /c 'handle.exe | findstr /i d:\'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 2 ] ; then
        echo -e '\n Showing All File Handles....\n'
        cmd.exe /c 'handle.exe'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 3 ] ; then
        echo -e '\n Showing All Process PIDs....\n'
        cmd.exe /c 'handle.exe' | grep 'pid'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 4 ] ; then
        echo -e '\n Closig File Handles....\n'
        cmd.exe /c start /D 'D:\Portable Apps\PortableApps.com\PortableApps\ProcessExplorerPortable' ProcessExplorerPortable.exe
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 5 ] ; then
        cmd.exe /c handle.exe /?
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 6 ] ; then
        echo -e '\n Showing the number of All Open Descriptors....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e "\n     The number of all open descriptors is: $(lsof | wc -l)\n"
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 7 ] ; then
        echo -e '\n Showing All Descriptors....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        # lsof
        ls /proc/*/fd
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Query Completed!\n'
    elif [ $input == b ] ; then
        manage
    elif [ $input == x ] ; then
        : && clear
    else
        handles
    fi
}

#   -------------------------------
#   WINDOWS MANAGEMET
#   -------------------------------

function win(){
    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '    Fixing NFTS:'
        echo    '        1  | Dry-Run'
        echo    '        2  | Fix'
        echo    '        3  | Help'
        echo    '    Repairing Windows System Files'
        echo    '        4  | Repair'
        echo    '        5  | Help'
        echo    '    Delete Services'
        echo    '        6  | Delete a Service'
        echo    '    Shotcuts'
        echo    '        7  | qaccess           | Quick Access'
        echo -e '        8  | icons             | Start Menu & Taskbar Icons\n'
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
    fi

    function qaccess(){
        if [ -z $1 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Pin Folders to Quick Access'
            echo -e '       2  | Unpin Folders from Quick Access\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$1
        fi

        # Variables
        powershellScript='D:\Workspace\Projects\Programing\Scripts\PowerShell\Quick_Access\Set-QuickAccess.ps1'
        # cmd.exe /c "D:\Workspace\Projects\Programing\Scripts\PowerShell\Quick Access\Set-QuickAccess.cmd"
        p='Pin'
        up='Unpin'
        pins=(
            "'D:\'"
            "'D:\Workspace\~temp'"
            "'D:\Anime'"
            "'D:\Workspace\Projects\Programing\~References\Programs\Browsers\Chrome\HTML Bookmarks\Archive'"
            "'D:\Workspace\Essential'"
            "'D:\Workspace\Personal'"
            "'D:\Workspace\Personal\Professional\CV'"
            "'D:\Workspace\Personal\Blog'"
            "'D:\Workspace\Tech'"
            "'D:\movies'"
            "'D:\series'"
            "'D:\Workspace\Shared'"
            "'D:\Portable Apps'"
            "'D:\Workspace\Projects'"
            "'D:\Workspace\Projects\Programing'"
            "'D:\Workspace\University\Course\Year 2 - 2017-2018'"
            "'D:\Workspace\Essential\Art\Screenshots\Pics'"
            "'C:\Users\Todorov\Pictures\My Screen Shots'"
            "'C:\Users\Todorov\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\todorov'"
            "'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'"
        )

        case $input in
            1)
                echo -e '\n Pinnig folders to Quick Access....\n'
                for pin in "${pins[@]}"
                do : 
                    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& $powershellScript $p $pin"
                done
                echo -e '\n    Folders pinned!\n'  ;;
            2)
                echo -e '\n Unpinnig folders from Quick Access....\n'
                for pin in "${pins[@]}"
                do : 
                    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& $powershellScript $up $pin"
                done
                echo -e '\n    Folders unpinned!\n'  ;;
            b)  win ;;
            x)  : && clear ;;
            *)  qaccess
        esac
    }

    function icons(){
        if [ -z $1 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Pin icons to Taskbar'
            echo    '       2  | Pin icons to Start Menu'
            echo    '       3  | Unpin icons from Taskbar'
            echo -e '       4  | Unpin icons from Start Menu\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$1
        fi

        tpin=c:5386
        tunpin=c:5387
        spin=c:51201
        sunpin=c:51394
        patht="D:\Workspace\Tech\Shortcuts\Taskbar"
        paths="D:\Workspace\Tech\Shortcuts\Start Menu\Windows"
        taskbar=(
            "\File Explorer.lnk"
            "\ConEmu.lnk"
            "\Microsoft Edge.lnk"
            "\Google Chrome.lnk"
            "\Sublime Text 3.lnk"
        )
        startmenu=(
            "\Weather.lnk"
            "\Alarms & Clock.lnk"
            "\Camera.lnk"
            "\Maps.lnk"
            "\Calculator.lnk"
            "\Microsoft Store.lnk"
            "\News.lnk"
            "\Skype.lnk"
            "\Internet Explorer.lnk"
            "\Paint.lnk"
            "\Paint 3D.lnk"
            "\Registry Editor.lnk"
            "\Windows PowerShell ISE.lnk"
            "\Command Prompt.lnk"
            "\Run.lnk"
            "\Control Panel.lnk"
            "\Task Manager.lnk"
            "\Services.lnk"
            "\Disk Cleanup.lnk"
            "\Windows Defender Firewall with Advanced Security.lnk"
            "\Windows Mobility Center.lnk"
            "\On-Screen Keyboard.lnk"
            "\Computer Management.lnk"
            "\System Information.lnk"
            "\System Configuration.lnk"
            "\System Properties Protection.lnk"
        )
        cd /mnt/d/Workspace/Portable\ Apps/By\ Category/Windows\ Tweaks/Syspin/

        case $input in
            1)
                echo -e '\n Pinnig icons to Taskbar....\n'
                for pin in "${taskbar[@]}"
                do : 
                    cmd.exe /c syspin.exe "$patht$pin" $tpin
                    sleep 0.3s
                done
                echo -e '\n    Icons pinned!\n'  ;;
            2)
                echo -e '\n Pinnig icons to Start Menu....\n'
                for pin in "${startmenu[@]}"
                do : 
                    cmd.exe /c syspin.exe "$paths$pin" $spin
                    sleep 0.3s
                done
                echo -e '\n    Icons pinned!\n'  ;;
            3)
                echo -e '\n Unpinnig icons from Taskbar....\n'
                cmd.exe /c reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
                rm /mnt/c/Users/Todorov/AppData/Roaming/Microsoft/Internet\ Explorer/Quick\ Launch/User\ Pinned/TaskBar/*.lnk
                echo -e '\n    Icons unpinned!\n'  ;;
            4)
                echo -e '\n Unpinnig icons from Start Menu....\n'
                for pin in "${startmenu[@]}"
                do : 
                    cmd.exe /c syspin.exe "$paths$pin" $sunpin
                    sleep 0.2s
                done
                echo -e '\n    Icons unpinned!\n'  ;;
            b)  win ;;
            x)  : && clear ;;
            *)  icons
        esac
    }

    case $input in
        1)
            read -e -p "    Enter Drive Letter: " input2
            echo -e '\n Fixing NFTS for Drive '$input2':....\n'
            cmd.exe /c chkdsk ''$input2':'
            echo -e '\n     Query Completed!\n' ;;
        2)
            read -e -p "    Enter Drive Letter: " input3
            echo -e '\n Fixing NFTS for Drive '$input3':....\n'
            cmd.exe /c chkdsk /f ''$input3':'
            echo -e '\n     Query Completed!\n' ;;
        3)
            cmd.exe /c chkdsk /?
            echo -e '\n     Query Completed!\n' ;;
        4)
            echo -e '\n Repairing Windows System Files....\n'
            cmd.exe /c sfc /SCANNOW
            echo -e '\n     Query Completed!\n' ;;
        5)
            cmd.exe /c sfc /?
            echo -e '\n     Query Completed!\n' ;;
        6)
            read -e -p "    Enter Process to Delete: " input4
            echo -e '\n Deleting '$input4'....\n'
            cmd.exe /c sc delete ''$input4''
            echo -e '\n     Query Completed!\n' ;;
        7|qaccess)  qaccess $2 ;;
        8|icons)    icons $2 ;;
        b)  master ;;
        x)  : && clear ;;
        *)  win ;;
    esac
}

#   -------------------------------
#   DAILY WORK
#   -------------------------------

function mywork(){
    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:'
        echo    '       x  | Exit'
        echo -e '       b  | Go Back\n'
        echo    "    1  | todo                | TODOs"
        echo    "    2  | blog                | Blog"
        echo    "    3  | money               | Money"
        echo    "    4  | series              | Series"
        echo    "    5  | coc                 | Start Clash of Clans Bot"
        echo    "    6  | social              | Open social media sites"
        echo    "    7  | food                | Open food docs"
        echo -e "    8  | sport               | Open sport docs\n"
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
        input2=$2
        input3=$3
        input4=$4
    fi

    case $input in
        1|todo)        todo ;;
        2|blog)        blog $input2 $input3 ;;
        3|money)      money ;;
        4|series)      series ;;
        5|coc)         coc ;;
        6|social)      social $input2 $input3 $input4 ;;
        7|food)        food $input2 $input3 $input4 ;;
        8|sport)       sport $input2 ;;
        b)  master ;;
        x)  : && clear ;;
        *) mywork ;;
    esac
}

#   -------------------------------
#   MONEY BALANCE
#   -------------------------------

function money(){
    path='/mnt/d/Workspace/Projects/Programing/Scripts/Python/Money'
    clear && python3 $path/bg.py && python3 $path/uk.py
}

#   -------------------------------
#   SERIES
#   -------------------------------

function series(){
    path='/mnt/d/Workspace/Projects/Programing/Scripts/Python/Web'
    clear && python3 $path/series.py
}

#   -------------------------------
#   SOCIAL
#   -------------------------------

function social(){
    # set -x
    path="/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/net/social"
    path2="D:\Workspace\Projects\Programing\Git\dotfiles\.dotfiles\wsl\net\social"
    sites=$(cat ~/.dotfiles/wsl/net/social)
    files="/home/todorov/.dotfiles/wsl/net/social"

    function show_all(){
        browser="chrome"
        window="--new-window"

        case $1 in
            nt) window="" ;;
            c)  browser="chrome" ;;
            f)  browser="firefox" ;;
        esac

        case $2 in
            nt) window="" ;;
            c)  browser="chrome" ;;
            f)  browser="firefox" ;;
        esac

        case $browser in
            chrome)  chrome $window --start-maximized $sites ;;
            firefox) if [ "$1" == "nt" ] || [ "$2" == "nt" ]; then
                        while IFS= read -r line ; do
                            firefox $window "$line"
                        done < "$files"
                        # cat /home/todorov/.dotfiles/wsl/net/social | xargs -I % cmd.exe /c start /D 'D:\Portable Apps\PortableApps.com\PortableApps\FirefoxPortable' FirefoxPortable.exe %
                        # xargs -a /home/todorov/.dotfiles/wsl/net/social cmd.exe /c start /D 'D:\Portable Apps\PortableApps.com\PortableApps\FirefoxPortable' FirefoxPortable.exe "$line"
                     else
                        window="-new-window"
                        firefox $window $sites
                     fi ;;
        esac
    }

    function show_one(){
        site=$(sed -n "$1"p $path)
        browser="chrome"
        window="--new-window"

        case $2 in
            nt) window="" ;;
            c)  browser="chrome" ;;
            f)  browser="firefox" ;;
        esac

        case $3 in
            nt) window="" ;;
            c)  browser="chrome" ;;
            f)  browser="firefox" ;;
        esac

        case $browser in
            chrome) chrome $window --start-maximized $site ;;
            firefox)
                      if [ "$2" != "nt" ] && [ "$3" != "nt" ]; then
                          window="-new-window"
                          firefox $window $site
                      else
                          re='^[0-9]+,[0-9]+$'
                          if [[ $1 =~ $re ]] ; then
                              # printf '%s\n' "$site"
                              while IFS= read -r line ; do
                                  firefox $window "$line"
                              done <<< "$site"
                          else
                              firefox $window $site
                          fi
                      fi ;;
        esac
    }

    function social_import(){
        cp $path ~/.dotfiles/wsl/net
    }

    function edit_site(){
        sublime $path2 && social update
    }

    if [[ -z $1 ]]; then
        show_all
    else
        case $1 in
            nt) show_all "nt" ;;
            0) show_all $2 $3 ;;
            1|all)     mail && show_all $2 $3 ;;
            2|one)     show_one $2 $3 $4 ;;
            3|update)  social_import ;;
            4|edit)    edit_site ;;
            b)  mywork ;;
            x)  : && clear ;;
            *)  echo && echo "DESCRIPTION"
                echo "        social - manage social network usage" && echo
                echo "SYNTAX"
                echo "        social [nt (new-tab, new-window is default)]"
                echo "        social [OPTION]"
                echo "        social [OPTION] [nt] [f(firefox) | c(chrome - default)]"
                echo "        social one [ site-number | range-beginning-number,range-end-number ]" && echo
                echo "OPTIONS"
                echo "        all [nt]        Open all"
                echo "        one № [nt]      Open one" && echo
                echo "                            1   Facebook"
                echo "                            2   MAL Profile"
                echo "                            3   MAL Anime List"
                echo "                            4   WhatsApp"
                echo "                            5   LinkedIn"
                echo "                            6   GitHub"
                echo "                            7   Twitter"
                echo "                            8   Reddit"
                echo "                            9   lobste.rs"
                echo "                            10  Hacker News" && echo
                echo "        update     Update sites"
                echo "        edit       Edit sites" && echo ;;
        esac
    fi
}

#   -------------------------------
#   FOOD
#   -------------------------------

function food(){
    path="D:\Workspace\Essential\Cooking"
    doc1=$path"\Products.xlsx"
    doc2=$path"\Recipes.docx"
    doc3=$path"\Recipes.xlsx"
    doc4=$path"\Shoppping List.docx"
    doc5=$path"\Shoppping List.xlsx"
    doc6=$path"\Terms.docx"
    doc7=$path"\Tips\Tips.docx"
    doc8=$path"\Weekly Menu.docx"
    doc9=$path"\Weekly Meals.xlsx"
    re='^[0-9]+$'

    function open_docs(){
        case $1 in
            1)  o $doc1 ;;
            2)  o $doc2 ;;
            3)  o $doc3 ;;
            4)  o $doc4 ;;
            5)  o $doc5 ;;
            6)  o $doc6 ;;
            7)  o $doc7 ;;
            8)  o $doc8 ;;
            9)  o $doc9 ;;
        esac
    }

    if [[ $1 =~ $re ]] && [[ -z $2 ]]; then
        open_docs "$1"
    elif [[ $1 =~ $re ]] && [[ $2 =~ $re ]] && [[ -z $3 ]]; then
        open_docs "$1" && sleep 0.2s
        open_docs "$2"
    elif [[ $1 =~ $re ]] && [[ $2 =~ $re ]] && [[ $3 =~ $re ]] && [[ -z $4 ]]; then
        open_docs "$1" && sleep 0.2s
        open_docs "$2" && sleep 0.2s
        open_docs "$3"
    elif [[ $1 == b ]]; then
        mywork
    elif [[ $1 == x ]]; then
        : && clear
    else
        echo && echo "DESCRIPTION"
        echo "        food - open food related files" && echo
        echo "SYNTAX"
        echo "        food [OPTION]" && echo
        echo "OPTIONS"
        echo "        1   Products"
        echo "        2   Recipes"
        echo "        3   Recipes - Table"
        echo "        4   Shoppping List"
        echo "        5   Shoppping List - Table"
        echo "        6   Terms"
        echo "        7   Tips"
        echo "        8   Weekly Meals"
        echo "        9   Weekly Menu - Table" && echo
    fi
}

#   -------------------------------
#   SPORT
#   -------------------------------

function sport(){
    path="D:\Workspace\Essential\Health\Sport\Fitness"
    doc1=$path"\2018-04.xlsx"
    doc2=$path"\Exercises.xlsx"
    doc3=$path"\Training Program.docx"

    case $1 in
        1)  o $doc1 ;;
        2)  o $doc2 ;;
        3)  o $doc3 ;;
        b)  mywork ;;
        x)  : && clear ;;
        *)  echo && echo "DESCRIPTION"
            echo "        sport - open sport related files" && echo
            echo "SYNTAX"
            echo "        sport [OPTION]" && echo
            echo "OPTIONS"
            echo "        1   2018-04 Schedule"
            echo "        2   Exercises"
            echo "        3   Training Program" && echo ;;
    esac
}

#   -------------------------------
#   CLASH OF CLANS BOT
#   -------------------------------

function coc (){
    echo -e '\n Opening Clash of Clans Bot....\n'
    name=$(dir -AN1 | grep MyBot)
    path='C:\Users\Todorov\Downloads\'$name'\MyBot.run.exe'
    timeout 6s cmd.exe /c $path MyVillage MEmu MEmu
}

function cocu() {
    rm -rfv /mnt/c/Users/Todorov/Downloads/MyBot-MBR_v*
    cp -r /mnt/d/Workspace/Shared/pc/MyBotRun/MyBot-MBR_v* /mnt/c/Users/Todorov/Downloads
}


#   -------------------------------
#   MANAGE MY BLOG
#   -------------------------------

function blog(){
    gamespath="/mnt/d/Workspace/Personal/Blog/bgrebbels.mlvnt.com/public_html"
    blogpath="/mnt/d/Workspace/Personal/Blog/mlvnt.com/mvlnt"
    content="/mnt/d/Workspace/Personal/Blog/mlvnt.com/mlvnt/content"
    contents="D:\Workspace\Personal\Blog\mlvnt.com\mlvnt\content"
    bakedpath="/mnt/d/Workspace/Personal/Blog/mlvnt.com/public_html"
    filezilladir="D:\Portable Apps\PortableApps.com\PortableApps\FileZillaPortable"
    ext=".md"

    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '       My Blog:'
        echo    '           1  | goto   | Go to'
        echo    '           2  | run    | Run'
        echo    '           3  | server | Run on Web Server'
        echo    '           4  | bake   | Clean Bake'
        echo    '           5  | new    | New Post'
        echo    '       Game Site:'
        echo    '           6  | Go to'
        echo    '           7  | Run'
        echo    '       Manage:'
        echo    '           8  | Rsync'
        echo -e '           9  | SFTP\n'
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
    fi

    function tpe() {
        read -e -p "  type? " type
        case $type in
            1|code)
                t="code"  
                path="blog/tech/code/" ;;
            2|default)
                t="default"  
                path="blog/" ;;
            3|interests)
                t="interests"  
                path="blog/interests/" ;;
            4|projects)
                t="projects"  
                path="projects/" ;;
            5|tech)
                t="tech"  
                path="blog/tech/2018/" ;;
            6|wechat)
                t="wechat"  
                path="blog/wechat" ;;
            *)  clear && echo
                echo -e '\n  available types:'
                echo    '       1  |  code'
                echo    '       2  |  default'
                echo    '       3  |  interests'
                echo    '       4  |  projects'
                echo    '       5  |  tech'
                echo -e '       6  |  wechat\n'
                tpe ;;
        esac
    }

    case $input in
        1|goto)  cd "$blogpath" ;;
        2|run)  cd "$blogpath" && hugos ;;
        3|server)  rm -rfv "$bakedpath" && mkdir -p -v "$bakedpath"
            cd "$blogpath" && hugo 
            cd "$bakedpath" && caddy ;;
        4|bake)  rm -rfv "$bakedpath" && mkdir -p -v "$bakedpath"
            cd "$blogpath" && hugo 
            rm -rfv "$bakedpath/tags" "$bakedpath/categories";;
        5|new)  clear && echo
            tpe
            clear && echo "$t"
            echo && tree "$content/$path" && echo 
            read -e -p "  post name? " post
            cd "$blogpath" && echo && hugo new $path/$post$ext -k $t && echo
            sublime "$contents/$path/$post$ext" ;;
        6)  cd "$gamespath" ;;
        7)  cd "$gamespath" && caddy ;;
        8)  # rsync -a ~/testfile todorov@mlvnt.com:~/ 
            ;;
        9)  cmd.exe /c start /D "$filezilladir" FileZillaPortable.exe ;;
            # sftp -b ~/.dotfiles/wsl/net/sftpbatch todorovfiles@mlvnt.com
            # sftp todorovfiles@mlvnt.com:uploads/
        b)  mywork ;;
        x)  : && clear ;;
        *)  blog ;;
    esac
}

#   -------------------------------
#   MANAGE MY TODOS
#   -------------------------------

function todo(){
    guipath='D:\Portable Apps\By Category\Office\Notes\jdotxt'
    # todotxtpath="/mnt/d/Workspace/Shared/mobile/config/apps/notes/todo.txt"
    todotxtpath="D:\Workspace\Shared\mobile\config\apps\notes\todo.txt"
    todopath=~/bin/todo.txt-cli/todo.sh
    clear && echo && $todopath -z -P -@ -+ list && echo
    read -p "Press enter to continue"

    echo
    echo -e '\n  Available Options:\n'
    echo    '           x  | exit   | Exit'
    echo    '           b  | back   | Go Back'
    echo    '       CLI:'
    echo    '           1  | Add'
    echo    '           2  | Done'
    echo    '           3  | Delete, Replace, Append'
    echo    '           4  | List'
    echo    '           5  | Help'
    echo    '           6  | Open todo.txt Dir'
    echo    '       GUI:'
    echo -e '           7  | Start GUI\n'
    read -e -p "  Enter Option: " input
    echo

    function refresh(){
        echo
        read -p "Press enter to continue"
        todo
    }

    function add(){
        clear
        echo "  New TASK [PRIORITY TASK PROJECT TAG DUE]" && echo
        read -e -p "  Priority [A-Z] : " priority
        read -e -p "  Task: " task
        read -e -p "  Project : " project
        read -e -p "  Tag : " tag
        read -e -p "  Due Date [yy-mm-dd]: " due

        if [ -z "$tag" ] ; then
            $tag
        else
            tag=+$tag
        fi

        if [ -z "$project" ] ; then
            $project
        else
            project=@$project
        fi

        if [ -z "$priority" ] ; then
            $priority
        else
            priority='('$priority')'
        fi

        if [ -z "$due" ] ; then
            $due
        else
            due=due:$due
        fi

        if [ -z "$task" ] ; then
            :
        else
            echo && $todopath -t add $priority $task $project $tag $due
        fi

        echo && $todopath -z -P list && echo
        refresh
    }

    function completed(){
        clear && echo && $todopath -z -P -@ -+ list && echo
        read -e -p "  Task ID to mark as done: " ID
        echo && $todopath -A do $ID && echo
        echo && $todopath listfile done.txt && echo
        refresh
    }

    function manage (){
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Delete'
        echo    '       2  | Replace'
        echo -e '       3  | Append\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)
                clear && echo && $todopath -z -P -@ -+ list && echo
                echo "  Delete TASK"
                echo "  Delete TASK [TERM]" && echo
                read -e -p "  Task ID to delete: " ID
                read -e -p "  Term to delete: " term
                $todopath del $ID $term
                echo && $todopath -z -P -@ -+ list && echo 
                refresh ;;
            2)
                clear && echo && $todopath -z -P -@ -+ list && echo
                echo "  Replace TASK [NEW TERM]" && echo
                read -e -p "  Task ID to replace: " ID
                read -e -p "  Term to replace: " term
                $todopath replace $ID $term
                echo && $todopath -z -P -@ -+ list && echo 
                refresh ;;
            3)
                clear && echo && $todopath -z -P -@ -+ list && echo
                echo "  Append TASK [NEW TERM]" && echo
                read -e -p "  Task ID to append to: " ID
                read -e -p "  Term to append: " term
                $todopath append $ID $term
                echo && $todopath -z -P -@ -+ list && echo 
                refresh ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  manage ;;
        esac
    }

    function list (){
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | List Todo'
        echo    '       2  | List Todo [yy-mm-dd @ +]'
        echo    '       3  | List Done'
        echo    '       4  | List by Project'
        echo -e '       5  | List by Tag\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)
                clear && echo && $todopath -z -P -@ -+ list && echo 
                refresh ;;
            2)
                clear && echo && $todopath -P list && echo 
                refresh ;;
            3)
                clear && echo && $todopath listfile done.txt && echo 
                refresh ;;
            4)
                clear && echo -e "\nProjecs Available:\n" && $todopath listcon
                echo && read -e -p "  Project : " project
                echo && clear && echo && $todopath -z -@ list @$project && echo 
                refresh ;;
            5)
                clear && echo -e "\nTags Available:\n" && $todopath listproj
                echo && read -e -p "  Tag : " tag
                echo && clear && echo && $todopath -z -+ list +$tag && echo 
                refresh ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  list ;;
        esac
    }

    function helpt (){
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Short'
        echo -e '       2  | Long\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)  $todopath shorthelp && todo ;;
            2)  $todopath help && todo ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  helpt ;;
        esac
    }

    case $input in
        1)  add ;;
        2)  completed ;;
        3)  manage ;;
        4)  list ;;
        5)  helpt ;;
        6)  o $todotxtpath && refresh ;;
        7)  cmd.exe /c start /D "$guipath" jdotxt-0.4.8.jar 
            refresh ;;
            # java -jar jdotxt-0.4.8.jar
        b|back)  mywork ;;
        x|exit)  : && clear ;;
        *)  todo ;;
    esac
}

#   -------------------------------
#   MY PROGRAMS
#   -------------------------------

function apps(){
    function portable_apps() {
        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '           x   Exit'
            echo    '           b   Go Back'
            echo -e '\n   >>> Portable Apps Suites\n'
            echo    '           1   Apps by Category'
            echo    '           2   PortableApps Client'
            echo    '           3   PortableApps Apps'
            echo    '           4   SyMenu'
            echo    '           5   SyMenu Apps'
            echo    '           6   GeGeek ToolKit'
            echo    '           7   LiberKey'
            echo -e '\n   >>> Net\n'
            echo    '           8   MyBotRun'
            echo    '           9   AnyDesk'
            echo    '           10  aTubeCatcher'
            echo    '           11  FileZilla'
            echo    '           12  HexChat'
            echo    '           13  JDownloader'
            echo    '           14  Mozilla Firefox'
            echo    '           15  Mozilla Thunderbird'
            echo    '           16  Opera'
            echo    '           17  Popcorn-Time'
            echo    '           18  qBittorrent'
            echo    '           19  QuiteRSS'
            echo    '           20  Skype'
            echo    '           21  SyncTrayzor'
            echo    '           22  Taiga'
            echo    '           23  Tor Browser'
            echo    '           24  Torrents Open Regisration'
            echo    '           25  Wireshark'
            echo    '           26  XAMPP'
            echo -e '\n   >>> Development\n'
            echo    '           27  CodeBlocks'
            echo    '           28  Eclipse'
            echo    '           29  Java Decompiler'
            echo    '           30  Matlab'
            echo    '           31  Meld'
            echo    '           32  NetBeans'
            echo    '           33  Notepad++'
            echo    '           34  R-Studio'
            echo    '           35  RegexBuddy4'
            echo    '           36  RegExr'
            echo    '           37  Sublime Text'
            echo    '           38  Visual Studio Code'
            echo -e '\n   >>> Productivity & Office\n'
            echo    '           39  KeePass'
            echo    '           40  Calibre'
            echo    '           41  draw.io'
            echo    '           42  GnuCash'
            echo    '           43  jdotxt'
            echo    '           44  LibreOffice'
            echo    '           45  MikTex Options'
            echo    '           46  MikTex Update'
            echo    '           76  MikTex Console'
            echo    '           47  TeXstudio'
            echo    '           74  TikzEdt'
            echo    '           48  SA Dictionary'
            echo    '           49  Vym'
            echo    '           50  yEd'
            echo    '           51  Zim'
            echo -e '\n   >>> Media\n'
            echo    '           52  Audacity'
            echo    '           53  Bino'
            echo    '           54  Blender'
            echo    '           55  GIMP'
            echo    '           56  Inkscape'
            echo    '           57  Instant Eyedropper'
            echo    '           58  gMKVExtractGUI'
            echo    '           59  MKVExtractGUI2'
            echo    '           60  OBS Studio'
            echo    '           77  Kodi'
            echo    '           78  Plex'
            echo -e '\n   >>> OS Management\n'
            echo    '           61  Everything'
            echo    '           62  MultiCommander'
            echo    '           63  ProcessExplorer'
            echo    '           64  RegSeeker'
            echo    '           65  Revo Uninstaller'
            echo    '           66  Rufus'
            echo    '           67  Etcher'
            echo    '           68  Snap2HTML'
            echo    '           69  Spybot Anit-Beacon'
            echo    '           70  Spyglass'
            echo    '           71  WinDirStat'
            echo    '           72  RealVNC'
            echo    '           73  TigerVNC'
            echo -e '           75  R-Studio\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n   >>> Main\n'
            echo    '           13  JDownloader'
            echo    '           61  Everything'
            echo    '           39  KeePass'
            echo    '           42  GnuCash'
            echo    '           14  Mozilla Firefox'
            echo    '           15  Mozilla Thunderbird'
            echo    '           65  Revo Uninstaller'
            echo    '           66  Rufus'
            echo    '           56  Inkscape'
            echo    '           41  draw.io'
            echo    '           18  qBittorrent'
            echo    '           21  SyncTrayzor'
            echo    '           11  FileZilla'
            echo    '           19  QuiteRSS'
            echo    '           22  Taiga'
            echo    '           12  HexChat'
            echo    '           2   PortableApps Client'
            echo    '           3   PortableApps Apps'
            echo    '           4   SyMenu'
            echo -e '           5   SyMenu Apps\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        case $input in
            1)
                o "D:\Portable Apps\By Category" && clear ;;
            2)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com" Start.exe && clear ;;
            3)
                o "D:\Portable Apps\PortableApps.com\PortableApps" && clear ;;
            4)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu" SyMenu.exe && clear ;;
            5)
                o "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite" && clear ;;
            6)
                cmd.exe /c start /D "D:\Portable Apps\GEGeek_Toolkit" SyMenu.exe && clear ;;
            7)
                cmd.exe /c start /D "D:\Portable Apps\LiberKey" LiberKey.exe && clear ;;
            8)
                o "D:\Workspace\Essential\Templates\Folders\Downloads\MyBotRun" && clear ;;
            9)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\AnyDesk_sps" AnyDesk.exe && clear ;;
            10)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\File Sharing\Downloading\aTube Catcher 2.0" yct.exe && clear ;;
            11)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\FileZillaPortable" FileZillaPortable.exe && clear ;;
            12)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\HexChatPortable" HexChatPortable.exe && clear ;;
            13)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\JDownloader_2_sps" JDownloader.jar && clear ;;
            14)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\FirefoxPortable" FirefoxPortable.exe && clear ;;
            15)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\ThunderbirdPortable" ThunderbirdPortable.exe && clear ;;
            16)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\OperaPortable" OperaPortable.exe && clear ;;
            17)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\File Sharing\Popcorn Time\Popcorn-Time" Popcorn-Time.exe && clear ;;
            18)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\qBittorrentPortable" qBittorrentPortable.exe && clear ;;
            19)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\QuiteRSSPortable" QuiteRSSPortable.exe && clear ;;
            20)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\sPortable\App\Skype\Phone" Skype.exe && clear ;;
            21)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\File Sharing\SyncTrayzorPortable-x64" SyncTrayzor.exe && clear ;;
            22)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\Social\Taiga" Taiga.exe && clear ;;
            23)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\Browsers\Tor Browser 7.0.6\Browser" firefox.exe && clear ;;
            24)
                cmd.exe /c "D:\Portable Apps\By Category\Net\File Sharing\Torrents Open Registrations Checker\Torrents Open Registrations Checker.exe" && clear ;;
            25)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\WiresharkPortable" WiresharkPortable.exe && clear ;;
            26)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\XAMPP" XAMPPLauncher.exe && clear ;;
            27)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\CodeBlocks\CodeBlocks-16.01mingw-nosetup" codeblocks.exe && clear ;;
            28)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\Eclipse" eclipse.exe && clear ;;
            29)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\Java Decompiler - gui-windows-1.4.0" jd-gui.exe && clear ;;
            30)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\MATLAB\R2017a\bin" matlab.exe && clear ;;
            31)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Compare\Meld" Meld.exe && clear ;;
            32)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\NetBeans 8.2\bin" netbeans64.exe && clear ;;
            33)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\Notepad++\Notepad++ 7.5.1" notepad++.exe && clear ;;
            34)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Recovery\R-StudioPortable 8.5.Build 170117" R-StudioPortable.exe && clear ;;
            35)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\Regex\RegexBuddy4" RegexBuddy4.exe && clear ;;
            36)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\Regex\RegExr" RegExr.exe && clear ;;
            37)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\Sublime Text" sublime_text.exe && clear ;;
            38)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Development\IDEs & Editors\VSCodePortable_1.16.1" VSCodePortable.exe && clear ;;
            39)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\KeePass_Professional_sps" KeePass.exe && clear ;;
            40)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\calibrePortable" calibrePortable.exe && clear ;;
            41)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Diagrams\draw.io" draw.io.exe && clear ;;
            42)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\GnuCashPortable" GnuCashPortable.exe && clear ;;
            43)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Notes\jdotxt" jdotxt-0.4.8.jar && clear ;;
            44)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\LibreOfficePortable" LibreOfficePortable.exe && clear ;;
            45)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Office\TeX\MikTEX\texmfs\install\miktex\bin" mo.exe && clear ;;
            46)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Office\TeX\MikTEX\texmfs\install\miktex\bin\internal" miktex-update.exe && clear ;;
            47)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Office\TeX\texstudio-2.12.8" texstudio.exe && clear ;;
            48)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Dictionaries\SA Dictionary 2013" Diction.exe && clear ;;
            49)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Diagrams\Mind Mapping\vym" vym.exe && clear ;;
            50)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Diagrams\yEd-3.17.2" yed.jar && clear ;;
            51)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Notes\Zim Desktop Wiki Portable" zim.exe && clear ;;
            52)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\AudacityPortable" AudacityPortable.exe && clear ;;
            53)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Video\Bino\bin" bino.exe && clear ;;
            54)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\BlenderPortable" BlenderPortable.exe && clear ;;
            55)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\GIMPPortable" GIMPPortable.exe && clear ;;
            56)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\InkscapePortable" InkscapePortable.exe && clear ;;
            57)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Images\Instant-eyedropper" instanteyedropper.exe && clear ;;
            58)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\MKVToolNix_(x64)_sps" gMKVExtractGUI.exe && clear ;;
            59)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\MKVToolNix_(x64)_sps" mkvtoolnix-gui.exe && clear ;;
            60)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Video\Screen Recording\OBS Studio\bin\64bit" obs64.exe && clear ;;
            61)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Everything_(x64)_sps" Everything.exe && clear ;;
            62)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\File Managers\MultiCommander_x64_Portable" MultiCommander.exe && clear ;;
            63)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\ProcessExplorerPortable" ProcessExplorerPortable.exe && clear ;;
            64)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\RegSeeker_sps" RegSeeker.exe && clear ;;
            65)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Program Management\Uninstallers\RevoPortable64" RevoUninstallerPortable.exe && clear ;;
            66)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\RufusPortable" RufusPortable.exe && clear ;;
            67)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Flashing\Etcher" Etcher-Portable-1.3.1-x64.exe && clear ;;
            68)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Snap2HTML_sps" Snap2HTML.exe && clear ;;
            69)
                cmd.exe /c start /D "D:\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Spybot_Anti-Beacon_sps" SDAntiBeacon.exe && clear ;;
            70)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Stats\Spyglass" Spyglass.exe && clear ;;
            71)
                cmd.exe /c start /D "D:\Portable Apps\PortableApps.com\PortableApps\WinDirStatPortable" WinDirStatPortable.exe && clear ;;
            72)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\VNC\RealVNC" VNC-Viewer-6.17.1113-Windows-64bit.exe && clear ;;
            73)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Net\VNC" TigerVNC-VncViewer-1.8.0.jar && clear ;;
            74)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Office\TeX\TikzEdtBeta0_2_3" TikzEdt.exe && clear ;;
            75)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Recovery\R-StudioPortable 8.5.Build 170117" R-StudioPortable.exe && clear ;;
            76)
                cmd.exe /c start /D "D:\Portable Apps\By Category\Office\Office\TeX\MikTEX\texmfs\install\miktex\bin" miktex-console.exe && clear ;;
            77)
                cmd.exe /c start /D "D:\Portable Apps\By Category\File Management\Media Centers\Kodi\Server" kodi.exe -p && clear ;;
            78)
                cmd.exe /c "D:\Portable Apps\By Category\File Management\Media Centers\Plex\Server\Plex Media Server.exe" && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                portable_apps ;;
        esac
    }

    function msoffice(){
        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Word'
            echo    '       2  | Excel'
            echo    '       3  | PowerPoint'
            echo    '       4  | Access'
            echo    '       5  | OneNote'
            echo    '       6  | Publisher'
            echo -e '       7  | Outlook\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        path="C:\Program Files\Microsoft Office\Office16"
        options='cmd.exe /c start'

        case $input in
            1)
                $options "$path" WINWORD.EXE && clear ;;
            2)
                $options "$path" EXCEL.EXE && clear ;;
            3)
                $options "$path" POWERPNT.EXE && clear ;;
            4)
                $options "$path" MSACCESS.EXE && clear ;;
            5)
                $options "$path" ONENOTE.EXE && clear ;;
            6)
                $options "$path" MSPUB.EXE && clear ;;
            7)
                $options "$path" OUTLOOK.EXE && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                msoffice ;;
        esac
    }

    function adobe(){
        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Acrobat DC'
            echo    '       2  | Photoshop CC'
            echo    '       3  | Illustrator CC'
            echo    '       4  | After Effects CC'
            echo    '       5  | Audition CC'
            echo    '       6  | Premiere Pro CC'
            echo -e '       7  | Media Encoder CC\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        options='cmd.exe /c start'
        path_acrobat="C:\Program Files (x86)\Adobe\Acrobat DC\Acrobat"
        path_photo="C:\Program Files\Adobe\Adobe Photoshop CC 2017"
        path_illust="C:\Program Files\Adobe\Adobe Illustrator CC 2017\Support Files\Contents\Windows"
        path_after="C:\Program Files\Adobe\Adobe After Effects CC 2017\Support Files"
        path_audition="C:\Program Files\Adobe\Adobe Audition CC 2017"
        path_premiere="C:\Program Files\Adobe\Adobe Premiere Pro CC 2017"
        path_encoder="C:\Program Files\Adobe\Adobe Media Encoder CC 2017"

        case $input in
            1)
                $options "$path_acrobat" Acrobat.exe && clear ;;
            2)
                $options "$path_photo" Photoshop.exe && clear ;;
            3)
                $options "$path_illust" Illustrator.exe && clear ;;
            4)
                $options "$path_after" AfterFX.exe && clear ;;
            5)
                $options "$path_audition" 'Adobe Audition CC.exe' && clear ;;
            6)
                $options "$path_premiere" 'Adobe Premiere Pro.exe' && clear ;;
            7)
                $options "$path_encoder" 'Adobe Media Encoder.exe' && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                adobe ;;
        esac
    }

    function installed_apps(){
        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '           x   Exit'
            echo    '           b   Go Back'
            echo -e '\n   >>> Apps Suites\n'
            echo    '           1   Microsoft Office'
            echo    '           2   Adobe Creative Cloud'
            echo -e '\n   >>> Basic Utilities\n'
            echo    '           3   4K Video Downloader'
            echo    '           4   PureVPN'
            echo    '           5   VirtualBox'
            echo    '           6   MEmu-Multi'
            echo    '           7   MEmu'
            echo    '           8   Wondershare Streaming Audio Recorder'
            echo    '           9   IsoBuster'
            echo    '           10  MagicISO'
            echo    '           11  TechSmith Camtasia'
            echo    '           12  Acronis True Image'
            echo    '           13  Keybase'
            echo    '           14  iTunes'
            echo    '           15  KeepVID'
            echo    '           16  IObit Advanced SystemCare'
            echo    '           17  IDM UltraCompare'
            echo    '           18  DVDFab'
            echo    '           19  Google Chrome'
            echo -e '\n   >>> Utilities\n'
            echo    '           20  7zip'
            echo    '           21  Gadwin PrintScreen'
            echo    '           22  Windows10 DPI Fix'
            echo    '           23  VLC Media Player'
            echo    '           24  AIMP'
            echo    '           25  Stardock Fences'
            echo    '           26  Windows 10 Upgrade Assistant'
            echo    '           27  Sandboxie Web Browser'
            echo    '           28  Sandboxie Any Program'
            echo    '           29  EssentialPIM'
            echo    '           30  SolidWorks'
            echo    '           36  TightVNC'
            echo -e '\n   >>> Development\n'
            echo    '           31  VcXsrv'
            echo    '           32  Sublime Text'
            echo    '           33  Android Studio'
            echo    '           34  Unity'
            echo -e '\n   >>> Games\n'
            echo -e '           35  Steam\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n   >>> Main\n'
            echo    '           1   Microsoft Office'
            echo    '           2   Adobe Creative Cloud'
            echo    '           3   4K Video Downloader'
            echo    '           4   PureVPN'
            echo    '           6   MEmu-Multi'
            echo    '           7   MEmu'
            echo    '           32  Sublime Text'
            echo    '           26  Windows 10 Upgrade Assistant'
            echo    '           15  KeepVID'
            echo -e '           16  IObit Advanced SystemCare\n'
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        case $input in
            1)
                msoffice && clear ;;
            2)
                adobe && clear ;;
            3)
                cmd.exe /c start /D "C:\Program Files (x86)\4KDownload\4kvideodownloader" 4kvideodownloader.exe && clear ;;
            4)
                cmd.exe /c start /D "C:\Program Files (x86)\PureVPN" purevpn.exe && clear ;;
            5)
                cmd.exe /c start /D "C:\Program Files\Oracle\VirtualBox" VirtualBox.exe && clear ;;
            6)
                cmd.exe /c start /D "C:\Program Files\Microvirt\MEmu" MEmuConsole.exe && clear ;;
            7)
                cmd.exe /c start /D "C:\Program Files\Microvirt\MEmu" MEmu.exe && clear ;;
            8)
                cmd.exe /c start /D "C:\Program Files (x86)\Wondershare\Streaming Audio Recorder" StreamingAudioRecorder.exe && clear ;;
            9)
                cmd.exe /c start /D "C:\Program Files (x86)\Smart Projects\IsoBuster" IsoBuster.exe && clear ;;
            10)
                cmd.exe /c start /D "C:\Program Files (x86)\MagicISO" MagicISO.exe && clear ;;
            11)
                cmd.exe /c start /D "C:\Program Files\TechSmith\Camtasia 9" CamtasiaStudio.exe && clear ;;
            12)
                cmd.exe /c start /D ""  && clear ;;
            13)
                cmd.exe /c start /D "C:\Users\Todorov\AppData\Local\Keybase\Gui" Keybase.exe && clear ;;
            14)
                cmd.exe /c start /D "C:\Program Files\iTunes" iTunes.exe && clear ;;
            15)
                cmd.exe /c start /D "C:\Program Files (x86)\KeepVid\KeepVid Pro" KeepVidPro.exe && clear ;;
            16)
                cmd.exe /c start /D "C:\Program Files (x86)\IObit\Advanced SystemCare" ASC.exe && clear ;;
            17)
                cmd.exe /c start /D "C:\Program Files\IDM Computer Solutions\UltraCompare" uc.exe && clear ;;
            18)
                cmd.exe /c start /D ""  && clear ;;
            19)
                cmd.exe /c start /D "C:\Program Files (x86)\Google\Chrome\Application" chrome.exe && clear ;;
            20)
                cmd.exe /c start /D "C:\Program Files\7-Zip" 7zFM.exe && clear ;;
            21)
                cmd.exe /c start /D "C:\Program Files\Gadwin\Gadwin PrintScreen" PrintScreen64.exe && clear ;;
            22)
                cmd.exe /c start /D "C:\Program Files (x86)\XPE Windows 10 DPI Fix" XPEWindows10_DPI_FIX.exe && clear ;;
            23)
                cmd.exe /c start /D "C:\Program Files\VideoLAN\VLC" vlc.exe && clear ;;
            24)
                cmd.exe /c start /D "C:\Program Files (x86)\AIMP" AIMP.exe && clear ;;
            25)
                cmd.exe /c start /D "C:\Program Files (x86)\Stardock\Fences" Fences.exe && clear ;;
            26)
                cmd.exe /c start /D "C:\Windows10Upgrade" Windows10UpgraderApp.exe && clear ;;
            27)
                cmd.exe /c start /D ""  && clear ;;
            28)
                cmd.exe /c start /D ""  && clear ;;
            29)
                cmd.exe /c start /D ""  && clear ;;
            30)
                cmd.exe /c start /D ""  && clear ;;
            31)
                cmd.exe /c start /D "C:\Program Files\VcXsrv" xlaunch.exe && clear ;;
            32)
                cmd.exe /c start /D "C:\Program Files\Sublime Text 3" sublime_text.exe && clear ;;
            33)
                cmd.exe /c start /D ""  && clear ;;
            34)
                cmd.exe /c start /D ""  && clear ;;
            35)
                cmd.exe /c start /D "C:\Program Files (x86)\Steam" Steam.exe && clear ;;
            36)
                cmd.exe /c start /D "C:\Program Files\TightVNC" tvnserver.exe && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                installed_apps ;;
        esac
    }

    function sysmenu_clean(){
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SyMenuSuite/_Trash/*
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/NirSoftSuite/_Trash/*
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SysinternalsSuite/_Trash/*
        clear
    }

    function qbittorrent(){
        rm -rfv /mnt/c/Users/Todorov/AppData/Local/qBittorrent
        rm -rfv /mnt/c/Users/Todorov/AppData/Roaming/qBittorrent
    }

    function program_management(){
        if [ -z $input2 ] ; then
            clear
            echo -e '\n  Available Options:'
            echo    '       x  | Exit'
            echo -e '       b  | Go Back\n'
            echo    "    1  | word                 | Open Word Documets"
            echo    "    2  | m3u                  | Create m3u Playlists"
            echo    "    3  | sysmenu_clean        | Clean SysMenu Trash"
            echo -e "    4  | qbittorrent          | Delete qBittorrent Config\n"
            read -e -p "  Enter Option: " input
            echo
        else
            input=$input2
        fi

        case $input in
            1|word)            word ;;
            2|m3u)             m3u ;;
            3|sysmenu_clean)   sysmenu_clean ;;
            4|qbittorrent)     qbittorrent ;;
            b)  apps ;;
            x)  : && clear ;;
            *)  program_management ;;
        esac
    }

    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:'
        echo    '       x  | Exit'
        echo -e '       b  | Go Back\n'
        echo    "    1  | portable_apps        | Portable"
        echo    "    2  | installed_apps       | Installed"
        echo -e "    3  | program_management   | Program Management\n"
        read -e -p "  Enter Option: " input
        echo
    else
        input=$1
        input2=$2
    fi

    case $input in
        1|portable_apps)       portable_apps ;;
        2|installed_apps)      installed_apps ;;
        3|program_management)  program_management ;;
        b)  master ;;
        x)  : && clear ;;
        *)  apps ;;
    esac
}

#   -------------------------------
#   OPEN MULTIPLE WORD DOCUMETS
#   -------------------------------

function word(){
    re='^[0-9]+$'
    path="D:\Workspace\Projects\Programing\~References\Programs\Office\Microsoft Office\Templates\Landscape.dotm"

    function wordo(){
        clear && echo
        for (( i=1; i<=$input; i++ ))
        do
           # echo "   Opening word document $i...."
           if [[ $orientation == l ]] ; then
               cmd.exe /c start /D 'C:\Program Files\Microsoft Office\Office16' /MAX WINWORD.EXE /t"$path"
               sleep 0.2s
            else
               cmd.exe /c start /D 'C:\Program Files\Microsoft Office\Office16' /MAX WINWORD.EXE /w
               sleep 0.2s
            fi
        done
        clear
    }

    if [[ $1 =~ $re ]] && [[ -z $2 ]] ; then
        input=$1
        orientation=""
        wordo
    elif [[ $1 =~ $re ]] && [[ $2 == l ]] ; then
        input=$1
        orientation=$2
        wordo
    elif [[ $1 == l  ]] && [[ $2 =~ $re ]] ; then
        input=$2
        orientation=$1
        wordo
    else
        echo && echo "DESCRIPTION"
        echo "        word - open Microsoft Word documents" && echo
        echo "SYNTAX"
        echo "        word [OPTION] [FILE NUMBER]"
        echo "        word [FILE NUMBER] [OPTION]" && echo
        echo "OPTIONS"
        echo "        l   Landscape orientation" && echo
    fi
}

#   -------------------------------
#   CREATE M3U PLAYLISTS
#   -------------------------------

function m3u() {
    echo -e '\n Tracklist \n    '_tracklist[ ${PWD##*/} ].m3u'\n Created....\n'
    find . -maxdepth 1 -not -type d -type f \( ! -iname "*.m3u" ! -iname "*.jpg" ! -iname "*.png" ! -iname "*.html" ! -iname "*.url" ! -iname "*.pdf" ! -iname "*.log" ! -iname "*.nfo" \) -printf "%P\n" >> "_tracklist[ ${PWD##*/} ].m3u"
    o "_tracklist[ ${PWD##*/} ].m3u"
    # find . -maxdepth 1 -not -type d -type f \( ! -iname "*.m3u" ! -iname "*.jpg" ! -iname "*.png" ! -iname "*.html" ! -iname "*.url" ! -iname "*.pdf" \) | sed 's|./||' >> "_tracklist[ ${PWD##*/} ].m3u"
    # dir -AN1I "*.jpg" -I "*.png" -I "*.html" -I "*.url" -I "*.m3u" -I "*.pdf" >> "_tracklist[ ${PWD##*/} ].m3u"
}

#=========================================================================================
#=========================================================================================
#=========================================================================================

# find shorthand
function f() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# List all files, long format, colorized, permissions in octal
function la() {
   ls -l  "$@" | awk '
    {
      k=0;
      for (i=0;i<=8;i++)
        k+=((substr($1,i+2,1)~/[rwx]/) *2^(8-i));
      if (k)
        printf("%0o ",k);
      printf(" %9s  %3s %2s %5s  %6s  %s %s %s\n", $3, $6, $7, $8, $5, $9,$10, $11);
    }'
}

# `v` with no arguments opens the current directory in Vim, otherwise opens the
# given location
function v() {
    if [ $# -eq 0 ]; then
        vim .;
    else
        vim "$@";
    fi;
}

# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
function getcertnames() {
    if [ -z "${1}" ]; then
        echo "ERROR: No domain specified.";
        return 1;
    fi;

    local domain="${1}";
    echo "Testing ${domain}…";
    echo ""; # newline

    local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
        | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

    if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
        local certText=$(echo "${tmp}" \
            | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
            no_serial, no_sigdump, no_signame, no_validity, no_version");
        echo "Common Name:";
        echo ""; # newline
        echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
        echo ""; # newline
        echo "Subject Alternative Name(s):";
        echo ""; # newline
        echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
            | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
        return 0;
    else
        echo "ERROR: Certificate not found.";
        return 1;
    fi;
}

# Run `dig` and display the most useful info
function digga() {
    dig +nocmd "$1" any +multiline +noall +answer;
}

# UTF-8-encode a string of Unicode symbols
function escape() {
    printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
    # print a newline unless we’re piping the output to another program
    if [ -t 1 ]; then
        echo ""; # newline
    fi;
}

# Create a data URL from a file
function dataurl() {
    local mimeType=$(file -b --mime-type "$1");
    if [[ $mimeType == text/* ]]; then
        mimeType="${mimeType};charset=utf-8";
    fi
    echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="${1:-8000}";
    sleep 1 && open "http://localhost:${port}/" &
    # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
    # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
    python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# Start a PHP server from a directory, optionally specifying the port
# (Requires PHP 5.4.0+.)
function phpserver() {
    local port="${1:-4000}";
    local ip=$(ipconfig getifaddr en1);
    sleep 1 && open "http://${ip}:${port}/" &
    php -S "${ip}:${port}";
}

# Compare original and gzipped file size
function gz1() {
    local origsize=$(wc -c < "$1");
    local gzipsize=$(gzip -c "$1" | wc -c);
    local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
    printf "orig: %d bytes\n" "$origsize";
    printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# get gzipped size
function gz2() {
  echo "orig size    (bytes): "
  cat "$1" | wc -c
  echo "gzipped size (bytes): "
  gzip -c "$1" | wc -c
}

# whois a domain or a URL
# function whois() {
#   local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
#   if [ -z $domain ] ; then
#     domain=$1
#   fi
#   echo "Getting whois record for: $domain …"

#   # avoid recursion
#           # this is the best whois server
#                           # strip extra fluff
#   /usr/bin/whois -h whois.internic.net $domain -H # | sed '/NOTICE:/q'
# }

# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
function targz() {
    local tmpFile="${@%/}.tar";
    tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" || return 1;

    size=$(
        stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
        stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
    );

    local cmd="";
    if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
        # the .tar file is smaller than 50 MB and Zopfli is available; use it
        cmd="zopfli";
    else
        if hash pigz 2> /dev/null; then
            cmd="pigz";
        else
            cmd="gzip";
        fi;
    fi;

    echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
    "${cmd}" -v "${tmpFile}" || return 1;
    [ -f "${tmpFile}" ] && rm "${tmpFile}";

    zippedSize=$(
        stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
        stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
    );

    echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
  if [ -f "$1" ] ; then
    local filename=$(basename "$1")
    local foldername="${filename%%.*}"
    local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
    local didfolderexist=false
    if [ -d "$foldername" ]; then
      didfolderexist=true
      read -e -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
      echo
      if [[ $REPLY =~ ^[Nn]$ ]]; then
        return
      fi
    fi
    mkdir -p "$foldername" && cd "$foldername"
    case $1 in
      *.tar.bz2) tar xjf "$fullpath" ;;
      *.tar.gz) tar xzf "$fullpath" ;;
      *.tar.xz) tar Jxvf "$fullpath" ;;
      *.tar.Z) tar xzf "$fullpath" ;;
      *.tar) tar xf "$fullpath" ;;
      *.taz) tar xzf "$fullpath" ;;
      *.tb2) tar xjf "$fullpath" ;;
      *.tbz) tar xjf "$fullpath" ;;
      *.tbz2) tar xjf "$fullpath" ;;
      *.tgz) tar xzf "$fullpath" ;;
      *.txz) tar Jxvf "$fullpath" ;;
      *.zip) unzip "$fullpath" ;;
      *) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Determine size of a file or total size of a directory
function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* ./*;
    fi;
}

# animated gifs from any video
# from Alex Sexton gist.github.com/SlexAxton/4989674
gifify () {
  if [[ -n "$1" ]]; then
  if [[ $2 == '--good' ]]; then
    ffmpeg -i "$1" -r 10 -vcodec png out-static-%05d.png
    time convert -verbose +dither -layers Optimize -resize 900x900\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > "$1.gif"
    rm out-static*.png
  else
    ffmpeg -i "$1" -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > "$1.gif"
  fi
  else
  echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# turn that video into webm.
# brew reinstall ffmpeg --with-libvpx
webmify () {
  ffmpeg -i "$1" -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -qmax 30 -y "$2" "$1.webm"
}

# `shellswitch [bash |zsh]`
#   Must be in /etc/shells
shellswitch () {
  chsh -s /usr/bin/$1
}

# Copy w/ progress
cp_p () {
  rsync -WavP --human-readable --progress $1 $2
}

#=========================================================================================================