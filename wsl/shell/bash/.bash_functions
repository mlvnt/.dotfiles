###############################################################################
# FUNCTIONS                                                                   #
###############################################################################
#   -------------------------------
#   Help Function
#   -------------------------------
function master() {
    clear
    echo ""
    echo "    1  | word              | Open Word Documets"
    echo "    2  | coc               | Start Clash of Clans Bot"
    echo "    3  | m3u               | Create m3u Playlists"
    echo "    4  | linx              | Linux Managemet"
    echo "    5  | bin               | Manage the Trash"
    echo "    6  | links             | Manage Links"
    echo "    7  | move              | Move, Copy"
    echo "    8  | dots              | Update .dotfiles"
    echo "    9  | handles           | Manage Open File Handles / Descriptors"
    echo "    10 | win               | Windows Maintanace"
    echo "    11 | blog              | Manage my Blog"
    echo "    12 | todo              | Manage my TODOs"
    echo ""
    read -e -p "Enter Function №? (y/n) " answer

    function helper() {
        read -e -p "Function? (№/name) : " input
        case $input in
            1|word)
                word ;;
            2|coc)
                coc ;;
            3|m3u)
                m3u ;;
            4|linx)
                linx ;;
            5|bin)
                bin ;;
            6|links)
                links ;;
            7|move)
                move ;;
            8|dots)
                dots ;;
            9|handles)
                handles ;;
            10|win)
                win ;;
            11|blog)
                blog ;;
            12|todo)
                todo ;;
            *)
                helper
        esac
    }

    if [ "$answer" = "y" ] ; then
        helper
    elif [ "$answer" = "n" ] ; then
        :
    else
        master
    fi
}
#   -------------------------------
#   Open multiple Word Documets
#   -------------------------------
function word (){
    clear
    echo ''
    read -e -p "  Enter № of word documents to open: " input
    echo
    for (( i=1; i<=input; i++ ))
    do
       echo "   Opening word document $i...."
       wordn
       sleep 1s
    done
}
#   -------------------------------
#   Start Clash of Clans Bot
#   -------------------------------
function coc (){
    echo -e '\n Opening Clash of Clans Bot....\n'
    path='C:\Users\Todorov\Desktop\MyBotRun\MyBot-MBR_v7.3.5\MyBot.run.exe'
    timeout 1s cmd.exe /c $path MyVillage1 MEmu MEmu
}
#   -------------------------------
#   Create m3u Playlists
#   -------------------------------
function m3u() {
    echo -e '\n Tracklist \n    '_tracklist[ ${PWD##*/} ].m3u'\n Created....\n'
    find . -maxdepth 1 -not -type d -type f \( ! -iname "*.m3u" ! -iname "*.jpg" ! -iname "*.png" ! -iname "*.html" ! -iname "*.url" ! -iname "*.pdf" ! -iname "*.log" \) -printf "%P\n" >> "_tracklist[ ${PWD##*/} ].m3u"
    o "_tracklist[ ${PWD##*/} ].m3u"
    # find . -maxdepth 1 -not -type d -type f \( ! -iname "*.m3u" ! -iname "*.jpg" ! -iname "*.png" ! -iname "*.html" ! -iname "*.url" ! -iname "*.pdf" \) | sed 's|./||' >> "_tracklist[ ${PWD##*/} ].m3u"
    # dir -AN1I "*.jpg" -I "*.png" -I "*.html" -I "*.url" -I "*.m3u" -I "*.pdf" >> "_tracklist[ ${PWD##*/} ].m3u"
}
#   -------------------------------
#   Linux Managemet
#   -------------------------------
function mkd() {
    mkdir -p "$@" && cd "$_";
}

function linx() {
    clear
    echo -e '\n  Available Options:'
    echo    '       x  | Exit'
    echo    '       b  | Go Back'
    echo    '       1  | Launch X Sessions'
    echo    '       2  | Create a New Directory and enter it'
    echo -e '       3  | List Git Branches\n'
    read -e -p "  Enter Option: " input
    echo

        function xsession (){
            path="D:\Workspace\Projects\Programing\Scripts\Scripts\Batch & Reg\WSL\VcXsrv Config"
            win32="C:\Windows\System32"
            clear
            echo -e '\n  Available Options:'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Launch Xfce4 Session'
            echo    '       2  | Launch i3-wm Session'
            echo -e '       3  | Load X Server in Multi Window mode\n'
            read -e -p "  Enter Option: " input
            echo
            if [ $input -eq 1 ] ; then
                echo -e "\n Launching xfce4....\n"
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                cmd.exe /c start /D "$path" /MAX configNormal.xlaunch
                cmd.exe /c start /D "$win32" bash.exe --login -c "sudo xfce4-session"
                echo -e "\n ....Xfce4 Session Started\n"
            elif [ $input -eq 2 ] ; then
                echo -e "\n Launching i3-wm....\n"
                echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                cmd.exe /c start /D "$path" /MAX configNormal.xlaunch
                cmd.exe /c start /D "$win32" bash.exe --login -c "sudo i3 "
                echo -e "\n ....i3-wm Session Started\n"
            elif [ $input -eq 3 ] ; then
                echo -e "\n Loading X Server in Multi Window mode....\n"
                cmd.exe /c start /D "$path" /MAX configMultiWindow.xlaunch
            elif [ $input == b ] ; then
                linx
            elif [ $input == x ] ; then
                : && clear
            else
                xsession
            fi
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

        # function sshing {
        #     ssh-keygen -b 4096
        #     cat ~/.ssh/id_rsa.pub | ssh todorov@mlvnt.com "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
        #     cat ~/.ssh/id_rsa.pub
        #     sudo vim /etc/ssh/sshd_config
        #     sudo service ssh restart
        #     function sshmod () {
        #         sudo chmod -v 600 ~/.ssh/*
        #         sudo chown -v $USER ~/.ssh/known_hosts
        #         sudo chmod -v 700 ~/.ssh
        #     }
        # }

        # function pgp ()
        #     # tip: first list your keys in GPG
        #     gpg -K --keyid-format long --with-colons --with-fingerprint

        #     # then export the one you want (look next to `fpr`)
        #     gpg --export -a A4AA3A5BDBD40EA549CABAF9FBC07D6A97016CB3
        #     # curl + gpg pro tip: import mlvnt's keys
        #     curl https://keybase.io/mlvnt/pgp_keys.asc | gpg --import
        # }

    if [ $input -eq 1 ] ; then
        xsession
    elif [ $input -eq 2 ] ; then
        mkd
    elif [ $input -eq 3 ] ; then
        glb
    elif [ $input == b ] ; then
        master
    elif [ $input == x ] ; then
        : && clear
    else
        linx
    fi
}
#   -------------------------------
#   Empty Trash
#   -------------------------------
function bin (){
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

    patht="D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe"
    trashdir=~/.local/share/Trash

    function list() {
        clear && echo
        echo "  1. List All"
        echo "  2. Search For" && echo
        read -e -p "  Option: " option
        if [ $option -eq 1 ] ; then
            echo && sudo trash-list && echo
        elif [ $option -eq 2 ] ; then
            read -e -p "  Search for: " search
            echo && sudo trash-list | grep -i $search && echo
        else
            list
        fi
    }

    function empty() {
        clear && echo && sudo trash-list && echo
        echo "  1. Empty"
        echo "  2. Remove selected" && echo
        read -e -p "  Option: " option
        if [ $option -eq 1 ] ; then
            sudo trash-empty
            echo && sudo trash-list && echo
        elif [ $option -eq 2 ] ; then
            read -e -p "  Delete: " search
            echo && sudo trash-rm $search && echo
        else
            empty
        fi
    }

    if [ $input -eq 1 ] ; then
        echo -e '\n Empting $RECYCLE.BIN....\n'
        cmd.exe /c "$patht" emptybin
        # cmd.exe /c 'D:\Workspace\Portable Apps\By Category\File Management\Recycle\recycle.exe' /L
        # echo -e '\n Empting $RECYCLE.BIN on C:\ ....\n'
        # cmd.exe /c rd /s /q '%systemdrive%\$Recycle.bin'
        # echo -e '\n Empting $RECYCLE.BIN on D:\ ....\n'
        # cmd.exe /c rd /s /q 'D:\$Recycle.bin'
    elif [ $input -eq 2 ] ; then
        ll && read -e -p "  What to trash: " rubish
        echo && sudo trash-put -v $rubish && echo
    elif [ $input -eq 3 ] ; then
        list
    elif [ $input -eq 4 ] ; then
        empty
    elif [ $input -eq 5 ] ; then
        clear && echo && sudo trash-restore && \
        echo && sudo trash-list && echo
    elif [ $input -eq 6 ] ; then
        cd $trashdir
    elif [ $input == b ] ; then
        master
    elif [ $input == x ] ; then
        : && clear
    else
        bin
    fi
}
#   -------------------------------
#   Manage Links
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

    path='/mnt/d/Workspace/General/Personal/Links/~genLinks/'
    pathwin='D:\Workspace\General\Personal\Links\~genLinks'

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
    if [ $input -eq 1 ] ; then
        cd $path && delsymb
    elif [ $input -eq 2 ] ; then
        cd $path && delsymb
        python3 .symb.py && open $pathwin
    elif [ $input -eq 3 ] ; then
        cd $path && delsymb
        python3 .symbf.py && open $pathwin
    elif [ $input -eq 4 ] ; then
        read -e -p "    Enter Target: " target
        read -e -p "    Enter Link Name: " linkname
        echo -e '\n Creating symblink '$linkname' to '$target'\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        ln -sv $target $linkname
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Link Created!\n'
    elif [ $input -eq 5 ] ; then
        read -e -p "    Enter Target: " -r target
        read -e -p "    Enter Link Name: " -r linkname
        echo -e '\n Creating symblink '$linkname' to '$target'\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        cmd.exe /c mklink $linkname $target
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Link Created!\n'
    elif [ $input -eq 6 ] ; then
        read -e -p "    Enter Target: " -r target
        read -e -p "    Enter Link Name: " -r linkname
        echo -e '\n Creating symblink '$linkname' to '$target'\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        cmd.exe /c mklink /D $linkname $target
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n ....Link Created!\n'
    elif [ $input == b ] ; then
        master
    elif [ $input == x ] ; then
        : && clear
    else
        links
    fi
}
#   -------------------------------
#   Move, Copy
#   -------------------------------
function move (){
    clear
    echo -e '\n  Available Options:\n'
    echo    '           x  | Exit'
    echo    '           b  | Go Back'
    echo    '       Backup:'
    echo    '           1  | Main Drive'
    echo    '           2  | Mobile SD Card'
    echo    '       Move:'
    echo    '           3  | ALL from Windows Temporary Directories'
    echo -e '           4  | Screenshots\n'
    read -e -p "  Enter Option: " input
    echo

    function main() {
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
        link_dir_1="/mnt/d/Workspace/General"
        link_dir_2="/mnt/d/Workspace/Shared"

        if [ $input -eq 1 ] || [ $input -eq 3 ] ; then 
            robonorm="/E" && rsyncnorm=''
        elif [ $input -eq 2 ] || [ $input -eq 4 ] ; then 
            robonorm="/E /PURGE" && rsyncnorm="--delete "
        fi

        if [ $input -eq 3 ] || [ $input -eq 4 ] ; then
            robocopyoptions="/L "$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
            ryncoptions="-avhzH --progress --stats --dry-run "$rsyncnorm""
        elif [ $input -eq 1 ] || [ $input -eq 2 ] ; then 
            robocopyoptions=""$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
            ryncoptions="-avhzH --progress --stats "$rsyncnorm""
        fi

        if [ $input -eq 1 ] || [ $input -eq 2 ] || [ $input -eq 3 ] || [ $input -eq 4 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
            mkdir -p "$logdir" && sudo touch "$logdir$logfile"

            function backups () {
                mkdir -p "$animemain"
                #######################################################################################################
                sudo rsync $ryncoptions --exclude-from="$excludeddir" "$drived" "$bakcupdire"
                echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                #######################################################################################################
                find $link_dir_1 $link_dir_2 -type l -print | xargs rm -v --
                cmd.exe /c robocopy "$workspacedird" "$workspacedire" "*" $robocopyoptions
                # CHCP 1251
            }

            backups | sudo tee -ai "$logdir$logfile"
            echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n'
        elif [ $input == b ] ; then
            move
        elif [ $input == x ] ; then
            : && clear
        else
            main
        fi
    }

    function mobile() {
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

            function backups () {
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

    function screenshots() {
        clear 
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '           1  | Anime Pics to Permanent Directory'
        echo    '           2  | Acer Screenshots to Permanent Directory'
        echo -e '           3  | Surface Screenshots to Permanent Directory\n'
        read -e -p "  Option: " input

        temp="/mnt/d/Workspace/~TEMP"
        screenshotsdir="/mnt/c/Users/Todorov/Pictures/My Screen Shots/"
        animepisdir="/mnt/d/Workspace/General/Essential/Art/Media Screenshots/Pics"
        acerscreendir="/mnt/d/Workspace/General/Tech/MEMORY/Desktop Screenshots/Acer Predator G9-792"
        srufscreendir="/mnt/d/Workspace/General/Tech/MEMORY/Desktop Screenshots/Microsoft Surface Pro 4"

        if [ $input -eq 1 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Moving to Anime Pics.... ~~~~~~~~~~~~~~\n'
            rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\[0-9]*.PNG --exclude=\* "$screenshotsdir" "$animepisdir"
            echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
            # open "$animepisdir"
        elif [ $input -eq 2 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Moving to Acer Screenshots.... ~~~~~~~~~~~~~~\n'
                rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$acerscreendir"
            echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
        elif [ $input -eq 3 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Moving to Surface Screenshots.... ~~~~~~~~~~~~~~\n'
            rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$srufscreendir"
            echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
        elif [ $input == b ] ; then
            move
        elif [ $input == x ] ; then
            : && clear
        else
            screenshots
        fi
    }

    if [ $input -eq 1 ] ; then
        main
    elif [ $input -eq 2 ] ; then
        mobile
    elif [ $input -eq 3 ] ; then

        downloads="/mnt/c/Users/Todorov/Downloads/"
        documents="/mnt/c/Users/Todorov/Documents/"
        temp="/mnt/d/Workspace/~TEMP"

        echo -e '\n ~~~~~~~~~~~~~~ Moving from Downloads.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --exclude desktop.ini "$downloads" "$temp"
        find "$downloads" -depth -type d -empty -delete
        echo -e '\n ~~~~~~~~~~~~~~ Moving from Documents.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\*  "$documents" "$temp"
        echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} "$temp" \;
    elif [ $input -eq 4 ] ; then
        screenshots
    elif [ $input == b ] ; then
        master
    elif [ $input == x ] ; then
        : && clear
    else
        move
    fi
}
#   -------------------------------
#   Update .dotfiles
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
        cd ~/.dotfiles/ && gl
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
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Converting .dotfiles to LF endings....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        sudo dos2unix ~/.dotfiles/wsl/*.* ~/.dotfiles/wsl/shell/zsh/.* ~/.dotfiles/wsl/shell/zsh/.oh-my-zsh-custom/.* ~/.dotfiles/wsl/shell/bash/.* ~/.dotfiles/wsl/editors/.* ~/.dotfiles/wsl/git/.* ~/.dotfiles/wsl/git/*.* ~/.dotfiles/wsl/bin/*
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Sourcing .dotfiles....\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        sca && clear
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n Dotfiles Updated!\n'
    elif [ $input == b ] ; then
        master
    elif [ $input == x ] ; then
        : && clear
    else
        dots
    fi
}
#   -------------------------------
#   Manage Open File Handles / Descriptors
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
        cmd.exe /c start /D 'D:\Workspace\Portable Apps\PortableApps.com\PortableApps\ProcessExplorerPortable' ProcessExplorerPortable.exe
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
        master
    elif [ $input == x ] ; then
        : && clear
    else
        handles
    fi
}
#   -------------------------------
#   Windows Maintanace
#   -------------------------------
function win(){
    clear
    echo -e '\n  Available Options:\n'
    echo    '           x  | Exit'
    echo    '           b  | Go Back'
    echo    '       Fixing NFTS:'
    echo    '           1  | Dry-Run'
    echo    '           2  | Fix'
    echo    '           3  | Help'
    echo    '       Repairing Windows System Files'
    echo    '           4  | Repair'
    echo    '           5  | Help'
    echo    '       Delete Services'
    echo    '           6  | Delete a Service'
    echo    '       Shotcuts'
    echo    '           7  | Quick Access'
    echo    '           8  | Start Menu & Taskbar Icons'
    echo    '       Programs'
    echo -e '           9  | List Available\n'
    read -e -p "  Enter Option: " input
    echo

    function nppfix (){
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Replace Corrupted Configuration'
        echo -e '       2  | Backup Configuration\n'
        read -e -p "  Enter Option: " input
        echo
        if [ $input -eq 1 ] ; then
            # Variables
            origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/ 
            destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/    
            # Function   
            echo -e "\n Replacing corrupted configuration....\n"
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sudo rsync -avhz --progress --stats --ignore-times "$origin" "$destination" --include=\*.xml --exclude=\*
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e "\n Finished\n"
            echo -e "\n Opening Notepad++....\n"
            npp
        elif [ $input -eq 2 ] ; then
            # set -x # Bash debuging
            # Variables
            origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/
            destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/
            file1=stylers.model.xml
            file2=stylers.xml
            file3=config.xml
            file4=contextMenu.xml
            file5=session.xml
            file6=shortcuts.xml
            Array1=($file1 $file2 $file3 $file4 $file5 $file6)
            # Function
            echo -e "\n Backup configuration....\n"
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            sudo rsync -avhz --progress --stats --ignore-times "$origin${Array1[0]}" "$origin${Array1[1]}" "$origin${Array1[2]}" "$origin${Array1[3]}" "$origin${Array1[4]}" "$origin${Array1[5]}" "$destination"
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e "\n Finished!\n"
            elif [ $input == b ] ; then
                apps
            elif [ $input == x ] ; then
                : && clear
            else
                nppfix
            fi
    }

    function msoffice(){
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
                msoffice
        esac
    }

    function adobe(){
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
                adobe
        esac
    }

    function apps(){
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Microsoft Office'
        echo    '       2  | Adobe'
        echo -e '       3  | Notepad++ Configuration Fix\n'
        read -e -p "  Enter Option: " input
        echo

        case $input in
            1)
                msoffice ;;
            2)
                adobe ;;
            3)
                nppfix ;;
            b)
                win ;;
            x)
                : && clear ;;
            *)
                apps
        esac
    }

    function icons(){
        cd /mnt/d/Workspace/Portable\ Apps/By\ Category/Windows\ Tweaks/Syspin/
        tpin=c:5386
        tunpin=c:5387
        spin=c:51201
        sunpin=c:51394
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
        if [ $input -eq 1 ] ; then
            echo -e '\n Pinnig icons to Taskbar....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\File Explorer.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Control Panel.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Task Manager.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Windows Mobility Center.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Registry Editor.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Command Prompt.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Ubuntu.lnk" $tpin
            # C:\Windows\explorer.exe shell:Appsfolder\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc!ubuntu
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Microsoft Edge.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\KeePass.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Google Chrome.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Notepad++.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\4K Video Downloader.lnk" $tpin
            cmd.exe /c syspin.exe "D:\Workspace\Shortcuts\Taskbar\Sublime Text 3.lnk" $tpin
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All icons are pinned!\n'
        elif [ $input -eq 2 ] ; then
            echo -e '\n Pinnig icons to Start Menu....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            syspin.exe "C:\Users\Todorov\Desktop\Ubuntu.lnk" c:5386
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All icons are pinned!\n'
        elif [ $input -eq 3 ] ; then
            echo -e '\n Unpinnig icons to Taskbar....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            cmd.exe /c reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" /f
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All icons are unpinned!\n'
        elif [ $input -eq 4 ] ; then
            echo -e '\n Unpinnig icons to Start Menu....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            syspin.exe "C:\Users\Todorov\Desktop\Ubuntu.lnk" c:5386
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All icons are unpinned!\n'
        elif [ $input == b ] ; then
            win
        elif [ $input == x ] ; then
            : && clear
        else
            icons
        fi
    }

    function qaccess(){
        clear
        echo -e '\n  Available Options:'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Pin Folders to Quick Access'
        echo -e '       2  | Unpin Folders to Quick Access\n'
        read -e -p "  Enter Option: " input
        echo ''

        # Variables
        powershellScript='D:\Workspace\Projects\Programing\Scripts\Scripts\PowerShell\Quick_Access\Set-QuickAccess.ps1'
        p='Pin'
        up='Unpin'
        pins=(
            "'D:\'"
            "'D:\Workspace\~TEMP'"
            "'D:\Anime'"
            "'D:\Anime\Current Season'"
            "'D:\Anime\Finished'"
            "'D:\Workspace\Projects\Programing\~References\Programes\Browsers\Chrome\HTML Bookmarks\Archive'"
            "'D:\Workspace\General'"
            "'D:\Workspace\General\Essential'"
            "'D:\Workspace\General\Personal'"
            "'D:\Workspace\General\Personal\Professional\CV & Covering Letter'"
            "'D:\Workspace\General\Essential\Cooking'"
            "'D:\Workspace\General\Personal\My Blog'"
            "'D:\Workspace\General\Tech\MEMORY'"
            "'D:\Movies'"
            "'D:\Series'"
            "'D:\Workspace\Shortcuts'"
            "'D:\Workspace\Portable Apps'"
            "'D:\Workspace\Projects'"
            "'D:\Workspace\Projects\Programing'"
            "'D:\Workspace\Projects\Mathematics'"
            "'D:\Workspace\University\Course\Year 2 - 2017-2018'"
            "'D:\Videos'"
            "'D:\Workspace\General\Essential\Art\Media Screenshots\Pics'"
            "'C:\Users\Todorov\Pictures\My Screen Shots'"
            "'C:\Users\Todorov\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\todorov'"
        )

        if [ $input -eq 1 ] ; then
            echo -e '\n Pinnig folders to Quick Access....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            for pin in "${pins[@]}"
            do : 
                powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& $powershellScript $p $pin"
            done
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All folders are pinned!\n'
        elif [ $input -eq 2 ] ; then
            echo -e '\n Unpinnig folders to Quick Access....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            for pin in "${pins[@]}"
            do : 
                powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "& $powershellScript $up $pin"
            done
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....All folders are unpinned!\n'
        elif [ $input == b ] ; then
            win
        elif [ $input == x ] ; then
            : && clear
        else
            qaccess
        fi
    }
    # cmd.exe /c "D:\Workspace\Projects\Programing\Scripts\Scripts\PowerShell\Quick Access\Set-QuickAccess.cmd"

    case $input in
        1)
            read -e -p "    Enter Drive Letter: " input2
            echo -e '\n Fixing NFTS for Drive '$input2':....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            cmd.exe /c chkdsk ''$input2':'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        2)
            read -e -p "    Enter Drive Letter: " input3
            echo -e '\n Fixing NFTS for Drive '$input3':....\n'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            cmd.exe /c chkdsk /f ''$input3':'
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        3)
            cmd.exe /c chkdsk /?
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        4)
            echo -e '\n Repairing Windows System Files....\n'
            cmd.exe /c sfc /SCANNOW
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        5)
            cmd.exe /c sfc /?
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        6)
            read -e -p "    Enter Process to Delete: " input4
            echo -e '\n Deleting '$input4'....\n'
            cmd.exe /c sc delete ''$input4''
            echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
            echo -e '\n ....Query Completed!\n' ;;
        7)
            qaccess ;;
        8)
            icons ;;
        9)
            apps ;;
        b)
            master ;;
        x)
            : && clear ;;
        *)
            win
    esac
}
#   -------------------------------
#   Manage my Blog
#   -------------------------------
function blog(){
    clear
    echo -e '\n  Available Options:'
    echo    '           x  | Exit'
    echo    '           b  | Go Back'
    echo    '       My Blog:'
    echo    '           1  | Go to'
    echo    '           2  | Go to & Run'
    echo    '           3  | Clean Bake'
    echo    '           4  | New Post'
    echo    '       Game Site:'
    echo    '           5  | Go to'
    echo    '           6  | Go to & Run'
    echo    '       Manage:'
    echo    '           7  | Rsync'
    echo -e '           8  | SFTP\n'
    read -e -p "  Enter Option: " input
    echo

    gamespath="/mnt/d/Workspace/General/Personal/My Blog/Blog/bgrebbels.mlvnt.com/public_html"
    blogpath="/mnt/d/Workspace/General/Personal/My Blog/Blog/mlvnt.com/mvlnt"
    content="/mnt/d/Workspace/General/Personal/My Blog/Blog/mlvnt.com/mlvnt/content"
    bakedpath="/mnt/d/Workspace/General/Personal/My Blog/Blog/mlvnt.com/public_html"
    filezilladir="D:\Workspace\Portable Apps\PortableApps.com\PortableApps\FileZillaPortable"

    case $input in
        1)
            cd "$blogpath" ;;
        2)
            cd "$blogpath" && hugos ;;
        3)
            rm -rfv "$bakedpath" && mkdir -p -v "$bakedpath" && hugo ;;
        4)
            clear && ls "$content" && echo
            read -e -p "  Post? " post
            read -e -p "  Type? " types
            cd "$blogpath" && echo && hugo new $post $types && echo ;;
        5)
            cd "$gamespath" ;;
        6)
            cd "$gamespath" && caddy ;;
        7)
            # rsync -a ~/testfile todorov@mlvnt.com:~/ 
            ;;
        8)
            cmd.exe /c start /D "$filezilladir" FileZillaPortable.exe ;;
            # sftp -b ~/.dotfiles/wsl/net/sftpbatch todorovfiles@mlvnt.com
            # sftp todorovfiles@mlvnt.com:uploads/
        b)
            master ;;
        x)
            : && clear ;;
        *)
            blog
    esac
}
#   -------------------------------
#   Manage my TODOs
#   -------------------------------
function todo(){
    guipath='D:\Workspace\Portable Apps\By Category\Office\Notes\jdotxt'
    syncpath='D:\Workspace\Portable Apps\By Category\Net\File Sharing\SyncTrayzorPortable-x64'
    todotxtpath="/mnt/d/Workspace/General/ToDo/ToDos"
    todopath=~/bin/todo.txt-cli/todo.sh
    clear 
    echo && $todopath -z -P -@ -+ list && echo
    read -e -p "Show options? (y/n)" answer
    echo
    if [ "$answer" = "y" ] ; then

        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '       CLI:'
        echo    '           1  | Add'
        echo    '           2  | Done'
        echo    '           3  | Delete, Replace, Append'
        echo    '           4  | List'
        echo    '           5  | Help'
        echo    '           6  | Open ToDo.txt Dir'
        echo    '       GUI:'
        echo    '           7  | Start GUI'
        echo    '       Syncing:'
        echo -e '           8  | Sync\n'
        read -e -p "  Enter Option: " input
        echo

        function manage (){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Delete'
            echo    '       2  | Replace'
            echo -e '       3  | Append\n'
            read -e -p "  Your Choice: " input
                if [ $input -eq 1 ] ; then
                    clear && echo && $todopath -z -P -@ -+ list && echo
                    echo "  Delete TASK"
                    echo "  Delete TASK [TERM]" && echo
                    read -e -p "  Task ID to delete: " ID
                    read -e -p "  Term to delete: " term
                    $todopath del $ID $term
                    echo && $todopath -z -P -@ -+ list && echo
                elif [ $input -eq 2 ] ; then
                    clear && echo && $todopath -z -P -@ -+ list && echo
                    echo "  Replace TASK [NEW TERM]" && echo
                    read -e -p "  Task ID to replace: " ID
                    read -e -p "  Term to replace: " term
                    $todopath replace $ID $term
                    echo && $todopath -z -P -@ -+ list && echo
                elif [ $input -eq 3 ] ; then
                    clear && echo && $todopath -z -P -@ -+ list && echo
                    echo "  Append TASK [NEW TERM]" && echo
                    read -e -p "  Task ID to append to: " ID
                    read -e -p "  Term to append: " term
                    $todopath append $ID $term
                    echo && $todopath -z -P -@ -+ list && echo
                elif [ $input == b ] ; then
                    todo
                elif [ $input == x ] ; then
                    : && clear
                else
                    manage
                fi
        }

        function list (){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | List ToDo'
            echo    '       2  | List ToDo [yy-mm-dd @ +]'
            echo    '       3  | List Done'
            echo    '       4  | List by Project'
            echo -e '       5  | List by Tag\n'
            read -e -p "  Your Choice: " input
                if [ $input -eq 1 ] ; then
                    clear && echo && $todopath -z -P -@ -+ list && echo
                elif [ $input -eq 2 ] ; then
                    clear && echo && $todopath -P list && echo
                elif [ $input -eq 3 ] ; then
                    clear && echo && $todopath listfile done.txt && echo
                elif [ $input -eq 4 ] ; then
                    clear && echo -e "\nProjecs Available:\n" && $todopath listcon
                    echo && read -e -p "  Project : " project
                    echo && clear && echo && $todopath -z -@ list @$project && echo
                elif [ $input -eq 5 ] ; then
                    clear && echo -e "\nTags Available:\n" && $todopath listproj
                    echo && read -e -p "  Tag : " tag
                    echo && clear && echo && $todopath -z -+ list +$tag && echo
                elif [ $input == b ] ; then
                    todo
                elif [ $input == x ] ; then
                    : && clear
                else
                    list
                fi
        }

        function helpt (){
            clear
            echo -e '\n  Available Options:\n'
            echo    '       x  | Exit'
            echo    '       b  | Go Back'
            echo    '       1  | Short'
            echo -e '       2  | Long\n'
            read -e -p "  Your Choice: " input
                if [ $input -eq 1 ] ; then
                    $todopath shorthelp && todo
                elif [ $input -eq 2 ] ; then
                    $todopath help && todo
                elif [ $input == b ] ; then
                    todo
                elif [ $input == x ] ; then
                    : && clear
                else
                    helpt
                fi
        }

        if [ $input -eq 1 ] ; then
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
        elif [ $input -eq 2 ] ; then
            clear && echo && $todopath -z -P -@ -+ list && echo
            read -e -p "  Task ID to mark as done: " ID
            echo && $todopath -A do $ID && echo
            echo && $todopath listfile done.txt && echo
        elif [ $input -eq 3 ] ; then
            manage
        elif [ $input -eq 4 ] ; then
            list
        elif [ $input -eq 5 ] ; then
            helpt
        elif [ $input -eq 6 ] ; then
            cd $todotxtpath
        elif [ $input -eq 7 ] ; then
            cmd.exe /c start /D "$guipath" jdotxt-0.4.8.jar
            # java -jar jdotxt-0.4.8.jar
        elif [ $input -eq 8 ] ; then
            cmd.exe /c start /D "$syncpath" SyncTrayzor.exe
            # java -jar jdotxt-0.4.8.jar
        elif [ $input == b ] ; then
            master
        elif [ $input == x ] ; then
            : && clear
        else
            todo
        fi
    elif [ "$answer" = "n" ] ; then
        :
    else
        todo
    fi
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

#=============================================================================================================

# find /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ -type f -name "[0-9]*.PNG" -print
# find /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ -type f -regex ".*/[0-9]+\.PNG"
# find /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ -type f -regex ".*/[0-9]+[.]PNG"
# find /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ -type f -regex ".*/[0-9]+[.]PNG"
# find . -regex '\./[0-9]+\.PNG'
# find . -regextype posix-egrep -regex '\./[0-9]+\.PNG'
# find . -regextype posix-egrep -regex '\./[0-9]+.PNG'
# find . -regextype posix-extended -regex '\./[0-9]+.PNG'
# find . -regextype posix-extended -regex '\./[[:digit:]]+.PNG'
# find . -regextype posix-extended -regex '\./[[:digit:]]+\.PNG'
# find . -regextype posix-extended -regex '\./[[:digit:]]+\.+PNG'

# Robocopy
# function mvall(){
#     echo -e "\n Moving from Downloads....\n"
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     cmd.exe /c ROBOCOPY 'C:\Users\Todorov\Downloads' 'D:\Workspace\~TEMP' * /MOVE /E /COPY:DAT /DCOPY:DAT /XF *.ini
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo -e "\n Moving from Documents....\n"
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"  
#     cmd.exe /c ROBOCOPY 'C:\Users\Todorov\Documents' 'D:\Workspace\~TEMP' * /MOV /COPY:DAT /XF *.ini
#     echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#     echo -e "\n Finished\n"
# }

# Rsync
# function mvall(){
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t /mnt/d/Workspace/~TEMP
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} /mnt/d/Workspace/~TEMP
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} /mnt/d/Workspace/~TEMP \;
# }

# function nppb(){
#     yes yes| cp -va "$origin$file1" "$destination"
    
#     for (( c=0; c<=5; c++ )); do  
#     local Array1=("$origin${ARRAY[$c]}")     
#     if (( 5 <= $c )) # [ $c -eq 5 ] && (( 5 < $c )) # [ 5 -ne $c ] 
#     then
#         echo ${Array1[@]} 
#         rsync -avhz --progress --ignore-times "${Array1[@]}" "$destination"
#         # array+=
#         # echo ${Array1[*]} 
#      # else  
#         #Array1=("$origin${ARRAY[$c]}")
#     fi    
#     done

#     for (( c=0; c<=5; c++ ))
#     do
#         Array1=("$origin${ARRAY[$c]}")
#         # rsync -avhz --progress --ignore-times "${Array1[*]}" "$destination"
#         echo ${Array1[*]}        
#     done         
# }

# ll | ws -l