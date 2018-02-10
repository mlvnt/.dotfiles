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
    echo "    13 | apps              | My Programs"
    echo ""
    read -e -p "Enter Function №? (y/n) " answer

    function helper() {
        read -e -p "Function? (№/name) : " input
        case $input in
            1|word)      word ;;
            2|coc)       coc ;;
            3|m3u)       m3u ;;
            4|linx)      linx ;;
            5|bin)       bin ;;
            6|links)     links ;;
            7|move)      move ;;
            8|dots)      dots ;;
            9|handles)   handles ;;
            10|win)      win ;;
            11|blog)     blog ;;
            12|todo)     todo ;;
            13|apps)     apps ;;
            *)           helper ;;
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
function word(){
    if [ -z $1 ] ; then 
        clear && echo
        read -e -p "  Enter № of word documents to open: " input
        echo
        for (( i=1; i<=input; i++ ))
        do
           echo "   Opening word document $i...."
           wordn && sleep 1s
        done
        clear
    else 
        re='^[0-9]+$'
        if [[ $1 =~ $re ]] ; then
            clear && echo
            for (( i=1; i<=$1; i++ ))
            do
               echo "   Opening word document $i...."
               wordn && sleep 1s
            done
            clear
        else
            word
        fi
    fi
}
#   -------------------------------
#   Start Clash of Clans Bot
#   -------------------------------
function coc (){
    echo -e '\n Opening Clash of Clans Bot....\n'
    path='C:\Users\Todorov\Downloads\MyBot-MBR_v7.4.3\MyBot.run.exe'
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
    echo    '       3  | SSH Managemet'
    echo    '       4  | GPG Managemet'
    echo -e '       5  | List Git Branches\n'
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

            case $input in
                1)
                    echo -e "\n Launching xfce4....\n"
                    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                    cmd.exe /c start /D "$path" /MAX configNormal.xlaunch
                    cmd.exe /c start /D "$win32" bash.exe --login -c "sudo xfce4-session"
                    echo -e "\n ....Xfce4 Session Started\n" ;;
                2)
                    echo -e "\n Launching i3-wm....\n"
                    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                    cmd.exe /c start /D "$path" /MAX configNormal.xlaunch
                    cmd.exe /c start /D "$win32" bash.exe --login -c "sudo i3 "
                    echo -e "\n ....i3-wm Session Started\n";;
                3)
                    echo -e "\n Loading X Server in Multi Window mode....\n"
                    cmd.exe /c start /D "$path" /MAX configMultiWindow.xlaunch;;
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

        function ssh_man() {
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

            function ssh_manage () {
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
                    ssh_manage ;;
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
                    sudo cp -r ~/.ssh/* /mnt/d/Workspace/General/Personal/My\ Blog/Resourses/SSH/Backup/.ssh/ ;;
                9)
                    sudo cp -r /mnt/d/Workspace/General/Personal/My\ Blog/Resourses/SSH/Backup/.ssh/* ~/.ssh/
                    ssh_manage ;;
                b)
                    linx ;;
                x)
                    : && clear ;;
                *)
                    ssh_manage ;;
            esac
        }

        function gpg_manage () {
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
        1)  xsession ;;
        2)  mkd ;;
        3)  ssh_manage ;;
        4)  gpg_manage ;;
        5)  glb ;;
        b)  master ;;
        x)  : && clear ;;
        *)  linx ;;
    esac
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
        link_dir_1="/mnt/e/B/backup/Workspace/General"
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
        link_dir_1="/mnt/d/Workspace/General"
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
        link_dir_1="/mnt/d/Workspace/General"
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

    case $input in
        1)
            main_backup ;;
        2)
            mobile_backup ;;
        3)
            main_restore ;;
        4)
            mobile_restore ;;
        5)
            main_clone ;;
        6)
            mobile_clone ;;
        7)
            downloads="/mnt/c/Users/Todorov/Downloads/"
            documents="/mnt/c/Users/Todorov/Documents/"
            temp="/mnt/d/Workspace/~TEMP"

            echo -e '\n ~~~~~~~~~~~~~~ Moving from Downloads.... ~~~~~~~~~~~~~~\n'
            rsync -avhz --progress --stats --ignore-existing --remove-source-files --exclude desktop.ini "$downloads" "$temp"
            find "$downloads" -depth -type d -empty -delete
            echo -e '\n ~~~~~~~~~~~~~~ Moving from Documents.... ~~~~~~~~~~~~~~\n'
            rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\*  "$documents" "$temp"
            echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n' ;;
            # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t "$temp"
            # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} "$temp"
            # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} "$temp" \;
        8)
            screenshots ;;
        b)
            master ;;
        x)
            : && clear ;;
        *)
            move ;;
    esac
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
        cd ~/.dotfiles/ && git stash && gl
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
    echo -e '           9  | Clean SysMenu Trash\n'
    read -e -p "  Enter Option: " input
    echo

    function sysmenu_clean(){
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SyMenuSuite/_Trash/*
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/NirSoftSuite/_Trash/*
        rm -rfv /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SysinternalsSuite/_Trash/*
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
            "'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'"
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
            sysmenu_clean ;;
        b)
            master ;;
        x)
            : && clear ;;
        *)
            win ;;
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
    echo    '           3  | Go to & Run on Web Server'
    echo    '           4  | Clean Bake'
    echo    '           5  | New Post'
    echo    '       Game Site:'
    echo    '           6  | Go to'
    echo    '           7  | Go to & Run'
    echo    '       Manage:'
    echo    '           8  | Rsync'
    echo -e '           9  | SFTP\n'
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
            rm -rfv "$bakedpath" && mkdir -p -v "$bakedpath"
            cd "$blogpath" && hugo 
            cd "$bakedpath" && caddy ;;
        4)
            rm -rfv "$bakedpath" && mkdir -p -v "$bakedpath" 
            cd "$blogpath" && hugo ;;
        5)
            clear && ls "$content" && echo
            read -e -p "  Post? " post
            read -e -p "  Type? " types
            cd "$blogpath" && echo && hugo new $post $types && echo ;;
        6)
            cd "$gamespath" ;;
        7)
            cd "$gamespath" && caddy ;;
        8)
            # rsync -a ~/testfile todorov@mlvnt.com:~/ 
            ;;
        9)
            cmd.exe /c start /D "$filezilladir" FileZillaPortable.exe ;;
            # sftp -b ~/.dotfiles/wsl/net/sftpbatch todorovfiles@mlvnt.com
            # sftp todorovfiles@mlvnt.com:uploads/
        b)
            master ;;
        x)
            : && clear ;;
        *)
            blog ;;
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
#   -------------------------------
#   My Programs
#   -------------------------------
function apps(){
    function portable_apps() {
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
        echo    '           47  TeXstudio'
        echo    '           48  SA Dictionary'
        echo    '           49  Vym'
        echo    '           50  yEd'
        echo    '           51  Zim'
        echo -e '\n   >>> Media Editing\n'
        echo    '           52  Audacity'
        echo    '           53  Bino'
        echo    '           54  Blender'
        echo    '           55  GIMP'
        echo    '           56  Inkscape'
        echo    '           57  Instant Eyedropper'
        echo    '           58  MKVToolNix'
        echo    '           59  MKVExtractGUI2'
        echo    '           60  OBS Studio'
        echo -e '\n   >>> OS Management\n'
        echo    '           61  Everything'
        echo    '           62  MultiCommander'
        echo    '           63  ProcessExplorer'
        echo    '           64  RegSeeker'
        echo    '           65  Revo Uninstaller'
        echo    '           66  Rufus'
        echo    '           67  Snap2HTML'
        echo    '           68  Spybot Anit-Beacon'
        echo    '           69  Spyglass'
        echo -e '           70  WinDirStat\n'
        echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        echo -e '\n   >>> Main\n'
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

        case $input in
            1)
                o "D:\Workspace\Portable Apps\By Category" && clear ;;
            2)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com" Start.exe && clear ;;
            3)
                o "D:\Workspace\Portable Apps\PortableApps.com\PortableApps" && clear ;;
            4)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu" SyMenu.exe && clear ;;
            5)
                o "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite" && clear ;;
            6)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\GEGeek_Toolkit" SyMenu.exe && clear ;;
            7)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\LiberKey" LiberKey.exe && clear ;;
            8)
                o "D:\Workspace\Shortcuts\Recent\MyBotRun" && clear ;;
            9)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\AnyDesk_sps" AnyDesk.exe && clear ;;
            10)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\File Sharing\Downloading\aTube Catcher 2.0" yct.exe && clear ;;
            11)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\FileZillaPortable" FileZillaPortable.exe && clear ;;
            12)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\HexChatPortable" HexChatPortable.exe && clear ;;
            13)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\JDownloader_2_sps" JDownloader.jar && clear ;;
            14)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\FirefoxPortable" FirefoxPortable.exe && clear ;;
            15)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\ThunderbirdPortable" ThunderbirdPortable.exe && clear ;;
            16)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\OperaPortable" OperaPortable.exe && clear ;;
            17)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\File Sharing\Popcorn Time\Popcorn-Time" Popcorn-Time.exe && clear ;;
            18)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\qBittorrentPortable" qBittorrentPortable.exe && clear ;;
            19)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\QuiteRSSPortable" QuiteRSSPortable.exe && clear ;;
            20)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\sPortable\App\Skype\Phone" Skype.exe && clear ;;
            21)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\File Sharing\SyncTrayzorPortable-x64" SyncTrayzor.exe && clear ;;
            22)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\Social\Taiga" Taiga.exe && clear ;;
            23)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\Browsers\Tor Browser 7.0.6\Browser" firefox.exe && clear ;;
            24)
                cmd.exe /c "D:\Workspace\Portable Apps\By Category\Net\File Sharing\Torrents Open Registrations Checker\Torrents Open Registrations Checker.exe" && clear ;;
            25)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Net\WiresharkPortable" WiresharkPortable.exe && clear ;;
            26)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\XAMPP" XAMPPLauncher.exe && clear ;;
            27)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\CodeBlocks\CodeBlocks-16.01mingw-nosetup" codeblocks.exe && clear ;;
            28)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\Eclipse" eclipse.exe && clear ;;
            29)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\Java Decompiler - gui-windows-1.4.0" jd-gui.exe && clear ;;
            30)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\MATLAB\R2017a\bin" matlab.exe && clear ;;
            31)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Compare\Meld" Meld.exe && clear ;;
            32)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\NetBeans 8.2\bin" netbeans64.exe && clear ;;
            33)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\Notepad++\Notepad++ 7.5.1" notepad++.exe && clear ;;
            34)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Recovery\R-StudioPortable 8.5.Build 170117" R-StudioPortable.exe && clear ;;
            35)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\Regex\RegexBuddy4" RegexBuddy4.exe && clear ;;
            36)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\Regex\RegExr" RegExr.exe && clear ;;
            37)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\Sublime Text" sublime_text.exe && clear ;;
            38)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Development\IDEs & Editors\VSCodePortable_1.16.1" VSCodePortable.exe && clear ;;
            39)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\KeePass_Professional_sps" KeePass.exe && clear ;;
            40)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\eBooks\Calibre Portable" calibre-portable.exe && clear ;;
            41)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Diagrams\draw.io" draw.io.exe && clear ;;
            42)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\GnuCashPortable" GnuCashPortable.exe && clear ;;
            43)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Notes\jdotxt" jdotxt-0.4.8.jar && clear ;;
            44)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\LibreOfficePortable" LibreOfficePortable.exe && clear ;;
            45)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Office\TeX\MikTEX\texmfs\install\miktex\bin" mo.exe && clear ;;
            46)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Office\TeX\MikTEX\texmfs\install\miktex\bin\internal" miktex-update.exe && clear ;;
            47)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Office\TeX\texstudio-2.12.6" texstudio.exe && clear ;;
            48)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Dictionaries\SA Dictionary 2013" Diction.exe && clear ;;
            49)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Diagrams\Mind Mapping\vym" vym.exe && clear ;;
            50)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Diagrams\yEd-3.17.2" yed.jar && clear ;;
            51)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Office\Notes\Zim Desktop Wiki Portable" zim.exe && clear ;;
            52)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\AudacityPortable" AudacityPortable.exe && clear ;;
            53)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Video\Bino\bin" bino.exe && clear ;;
            54)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\BlenderPortable" BlenderPortable.exe && clear ;;
            55)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\GIMPPortable" GIMPPortable.exe && clear ;;
            56)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\InkscapePortable" InkscapePortable.exe && clear ;;
            57)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Images\Instant-eyedropper" instanteyedropper.exe && clear ;;
            58)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\MKVToolNix_(x64)_sps" MKVExtractGUI2.exe && clear ;;
            59)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\MKVToolNix_(x64)_sps" mkvtoolnix-gui.exe && clear ;;
            60)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Video\Screen Recording\OBS Studio\bin\64bit" obs64.exe && clear ;;
            61)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Everything_(x64)_sps" Everything.exe && clear ;;
            62)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\File Managers\MultiCommander_x64_Portable" MultiCommander.exe && clear ;;
            63)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\ProcessExplorerPortable" ProcessExplorerPortable.exe && clear ;;
            64)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\RegSeeker_sps" RegSeeker.exe && clear ;;
            65)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\Program Management\Uninstallers\RevoPortable64" RevoUninstallerPortable.exe && clear ;;
            66)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\RufusPortable" RufusPortable.exe && clear ;;
            67)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Snap2HTML_sps" Snap2HTML.exe && clear ;;
            68)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\SyMenuSuite\Spybot_Anti-Beacon_sps" SDAntiBeacon.exe && clear ;;
            69)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\By Category\File Management\Stats\Spyglass" Spyglass.exe && clear ;;
            70)
                cmd.exe /c start /D "D:\Workspace\Portable Apps\PortableApps.com\PortableApps\WinDirStatPortable" WinDirStatPortable.exe && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                portable_apps ;;
        esac
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
                msoffice ;;
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
                adobe ;;
        esac
    }

    function installed_apps(){
        clear
        echo -e '\n  Available Options:'
        echo    '           x   Exit'
        echo    '           b   Go Back'
        echo -e '\n   >>> Apps Suites\n'
        echo    '           1   Microsoft Office'
        echo    '           2   Adobe Creative Cloud'
        echo -e '\n   >>> Basic Utilities\n'
        echo    '           3   Dashlane'
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
        echo    '           19  '
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
        echo    '           3   Dashlane'
        echo    '           4   PureVPN'
        echo    '           6   MEmu-Multi'
        echo    '           7   MEmu'
        echo    '           26  Windows 10 Upgrade Assistant'
        echo -e '           16  IObit Advanced SystemCare\n'
        read -e -p "  Enter Option: " input
        echo

        case $input in
            1)
                msoffice && clear ;;
            2)
                adobe && clear ;;
            3)
                cmd.exe /c start /D "C:\Users\Todorov\AppData\Roaming\Dashlane" Dashlane.exe && clear ;;
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
                cmd.exe /c start /D ""  && clear ;;
            15)
                cmd.exe /c start /D "C:\Program Files (x86)\KeepVid\KeepVid Pro" KeepVidPro.exe && clear ;;
            16)
                cmd.exe /c start /D "C:\Program Files (x86)\IObit\Advanced SystemCare" ASC.exe && clear ;;
            17)
                cmd.exe /c start /D "C:\Program Files\IDM Computer Solutions\UltraCompare" uc.exe && clear ;;
            18)
                cmd.exe /c start /D ""  && clear ;;
            19)
                cmd.exe /c start /D ""  && clear ;;
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
                cmd.exe /c start /D ""  && clear ;;
            33)
                cmd.exe /c start /D ""  && clear ;;
            34)
                cmd.exe /c start /D ""  && clear ;;
            35)
                cmd.exe /c start /D "C:\Program Files (x86)\Steam" Steam.exe && clear ;;
            b)
                apps ;;
            x)
                : && clear ;;
            *)
                installed_apps ;;
        esac
    }

    if [ -z $1 ] ; then
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Portable'
        echo -e '       2  | Installed\n'
        read -e -p "  Enter Option: " input
        echo
        case $input in
            1)  portable_apps ;;
            2)  installed_apps ;;
            b)  master ;;
            x)  : && clear ;;
            *)  apps ;;
        esac
    else
        case $1 in
            1)  portable_apps ;;
            2)  installed_apps ;;
            *)  apps ;;
        esac
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

# function nppfix (){
#     clear
#     echo -e '\n  Available Options:\n'
#     echo    '       x  | Exit'
#     echo    '       b  | Go Back'
#     echo    '       1  | Replace Corrupted Configuration'
#     echo -e '       2  | Backup Configuration\n'
#     read -e -p "  Enter Option: " input
#     echo
#     if [ $input -eq 1 ] ; then
#         # Variables
#         origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/ 
#         destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/    
#         # Function   
#         echo -e "\n Replacing corrupted configuration....\n"
#         echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#         sudo rsync -avhz --progress --stats --ignore-times "$origin" "$destination" --include=\*.xml --exclude=\*
#         echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#         echo -e "\n Finished\n"
#         echo -e "\n Opening Notepad++....\n"
#         npp
#     elif [ $input -eq 2 ] ; then
#         # set -x # Bash debuging
#         # Variables
#         origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/
#         destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/
#         file1=stylers.model.xml
#         file2=stylers.xml
#         file3=config.xml
#         file4=contextMenu.xml
#         file5=session.xml
#         file6=shortcuts.xml
#         Array1=($file1 $file2 $file3 $file4 $file5 $file6)
#         # Function
#         echo -e "\n Backup configuration....\n"
#         echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#         sudo rsync -avhz --progress --stats --ignore-times "$origin${Array1[0]}" "$origin${Array1[1]}" "$origin${Array1[2]}" "$origin${Array1[3]}" "$origin${Array1[4]}" "$origin${Array1[5]}" "$destination"
#         echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
#         echo -e "\n Finished!\n"
#         elif [ $input == b ] ; then
#             apps
#         elif [ $input == x ] ; then
#             : && clear
#         else
#             nppfix
#         fi
# }

# function main_clone() {
#     clear 
#     echo -e '\n  Available Options:\n'
#     echo    '           x  | Exit'
#     echo    '           b  | Go Back'
#     echo -e '           1  | Proceed\n'
#     read -e -p "  Option: " input

#     case $input in 
#         1)
#                 echo
#                 read -e -p "  Enter Drive Letter/Path [c]:" backdir
#                 dotfilesdird="/mnt/e/B/backup/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
#                 dotfilesdire="/mnt/"$backdir"/Workspace/Projects/Programing/Git/dotfiles/.dotfiles"
#                 drived="/mnt/e/B/backup/Workspace"
#                 drivedwin="E:\B\backup\Workspace"

#                 robocopyoptions="/E /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
#                 ryncoptions="-avhzH --progress --stats"

#                 echo -e '\n ~~~~~~~~~~~~~~ Cloning Main Drive.... ~~~~~~~~~~~~~~\n'
#                 function clone () {
#                     echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
#                     mkdir -p "/mnt/"$backdir"/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/"
#                     sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
#                     echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
#                     cmd.exe /c robocopy "$drivedwin" "$backdir:\\Workspace" "*" $robocopyoptions
#                 }
#                 clone 
#                 echo -e '\n ~~~~~~~~~~~~~~ Cloning Complete! ~~~~~~~~~~~~~~\n' 
#                 ;;
#         b)
#                 move ;;
#         x)
#                 : && clear ;;
#         *)
#                 main ;;
#     esac
# }