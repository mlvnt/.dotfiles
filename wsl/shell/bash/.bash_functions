###############################################################################
# FUNCTIONS                                                                   #
###############################################################################

#   -------------------------------
#   1.  Open multiple Word Documets
#   -------------------------------
function word (){
    clear
    echo ''
    read -p "  Enter № of word documents to open: " input
    printf "\n"
    for (( c=1; c<=input; c++ ))
    do
       echo "   Opening word document $c...."
       wordn
       sleep 1s
    done
}
#   -------------------------------
#   2.  Start Clash of Clans Bot
#   -------------------------------
function coc (){
    echo -e '\n Opening Clash of Clans Bot....\n'
    timeout 1s cmd.exe /c 'C:\Users\Todorov\Desktop\MyBotRun - MBR\MyBot-MBR_v7.2.5\MyBot.run.exe' MyVillage1 MEmu MEmu_2
}
#   -------------------------------
#   3.  Create m3u Playlists
#   -------------------------------
function m3u() {
    echo -e '\n Tracklist \n    '_tracklist[ ${PWD##*/} ].m3u'\n Created....\n'
    dir -AN1I "*.jpg" -I "*.png" -I "*.html" -I "*.url" -I "*.m3u" -I "*.pdf" >> "_tracklist[ ${PWD##*/} ].m3u"
}
#   -------------------------------
#   4.  Create a New Directory and enter it
#   -------------------------------
function mkd() {
    mkdir -p "$@" && cd "$_";
}
#   -------------------------------
#   5.  Manage Links
#   -------------------------------
function links (){
    # Delete Specified symbilic links
    function delsymb(){
    echo -e '\n Deleting Symbolic Links....\n'
    echo "=================================="
    find -type l -print | while IFS= read -r lnk
    do
      if readlink "$lnk" | grep '/mnt/' ; then
        rm "$lnk"
      fi
    done
    echo "=================================="
    echo -e '\n Symbolic Links Deleted!\n'
    }
    clear
    echo -e '\n  Available Options:'
    echo -e '       0. Exit'
    echo -e '       1. Delete Specified Symbilic Links'
    echo -e '       2. Create Symbolic Links for files'
    echo -e '       3. Create Symbolic Links for folders\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        cd "/mnt/d/Workspace/General/Personal Development/Links/_genLinks/"
        delsymb
        cd ~/
    elif [ $input -eq 2 ] ; then
        cd "/mnt/d/Workspace/General/Personal Development/Links/_genLinks/"
        delsymb
        python3 .symb.py
        open "D:\Workspace\General\Personal Development\Links\_genLinks"
        cd ~/
    elif [ $input -eq 3 ] ; then
        cd "/mnt/d/Workspace/General/Personal Development/Links/_genLinks/"
        delsymb
        python3 .symbf.py
        open "D:\Workspace\General\Personal Development\Links\_genLinks"
        cd ~/
    elif [ $input -eq 0 ] ; then
            :
    else
        links
    fi
}
#   -------------------------------
#   6.  Move, Copy
#   -------------------------------
function move (){
    clear
    echo -e '\n  Available Options:\n'
    echo -e '           0. Exit'
    echo -e '       Backup:'
    echo -e '         Main Drive:'
    echo -e '           1. Normal'
    echo -e '           2. Mirroring'
    echo -e '           3. Dry-Run Normal'
    echo -e '           4. Dry-Run Mirroring'
    echo -e '         Mobile SD Card:'
    echo -e '           5. Normal'
    echo -e '           6. Mirroring'
    echo -e '           7. Dry-Run Normal'
    echo -e '           8. Dry-Run Mirroring'
    echo -e '       Move:'
    echo -e '           9. ALL from Windows Temporary Directories'
    echo -e '           10. Anime Pics to Permanent Directory'
    echo -e '           11. Acer Screenshots to Permanent Directory'
    echo -e '           12. Surface Screenshots to Permanent Directory\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        echo -e '\n Backup Main Drive....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_logs/
        cd /mnt/e/Backup/backup_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Normal Backup
        sudo rsync -avhz --progress --stats --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded' /mnt/d/ /mnt/e/Backup/backup/ | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 2 ] ; then
        echo -e '\n Backup Main Drive....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_logs/
        cd /mnt/e/Backup/backup_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Mirroring  
        sudo rsync -avhz --progress --stats --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded' /mnt/d/ /mnt/e/Backup/backup/ --delete | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 3 ] ; then
        echo -e '\n Backup Main Drive....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_logs/
        cd /mnt/e/Backup/backup_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Dry-run for Normal Backup
        sudo rsync -avhz --progress --stats --dry-run --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded' /mnt/d/ /mnt/e/Backup/backup/ | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 4 ] ; then
        echo -e '\n Backup Main Drive....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_logs/
        cd /mnt/e/Backup/backup_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt 
        # Dry-run for Mirroring  
        sudo rsync -avhz --progress --stats --dry-run --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded' /mnt/d/ /mnt/e/Backup/backup/ --delete | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 5 ] ; then
        echo -e '\n Backup Mobile SD Card....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_mobile_logs/
        cd /mnt/e/Backup/backup_mobile_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Normal Backup
        sudo rsync -avhz --progress --stats --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded_mobile' /mnt/d/ /mnt/e/Backup/backup_mobile/ | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 6 ] ; then
        echo -e '\n Backup Mobile SD Card....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_mobile_logs/
        cd /mnt/e/Backup/backup_mobile_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Mirroring  
        sudo rsync -avhz --progress --stats --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded_mobile' /mnt/d/ /mnt/e/Backup/backup_mobile/ --delete | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 7 ] ; then
        echo -e '\n Backup Mobile SD Card....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_mobile_logs/
        cd /mnt/e/Backup/backup_mobile_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Dry-run for Normal Backup
        sudo rsync -avhz --progress --stats --dry-run --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded_mobile' /mnt/d/ /mnt/e/Backup/backup_mobile/ | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 8 ] ; then
        echo -e '\n Backup Mobile SD Card....\n'
        echo "=================================="
        mkdir -p /mnt/e/Backup/backup_mobile_logs/
        cd /mnt/e/Backup/backup_mobile_logs/
        sudo touch log_backup-$(date "+%Y-%m-%d-%H-%M").txt
        # Dry-run for Mirroring  
        sudo rsync -avhz --progress --stats --dry-run --exclude-from='/mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/rsync/excluded_mobile' /mnt/d/ /mnt/e/Backup/backup_mobile/ --delete | sudo tee -ai log_backup-$(date "+%Y-%m-%d-%H-%M").txt 
        echo "=================================="
        echo -e '\n Backup Complete!\n'
    elif [ $input -eq 9 ] ; then
        # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t /mnt/d/Workspace/_TEMP
        # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} /mnt/d/Workspace/_TEMP
        # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} /mnt/d/Workspace/_TEMP \;
        echo -e '\n Moving from Downloads....\n'
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-existing --remove-source-files --exclude desktop.ini /mnt/c/Users/Todorov/Downloads/ /mnt/d/Workspace/_TEMP
        find /mnt/c/Users/Todorov/Downloads/ -depth -type d -empty -delete
        echo "=================================="
        echo -e '\n Moving from Documents....\n'
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\* /mnt/c/Users/Todorov/Documents/ /mnt/d/Workspace/_TEMP
        echo "=================================="
        echo -e '\n Finished!\n'
    elif [ $input -eq 10 ] ; then
        echo -e "\n Moving to Anime Pics....\n"
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-existing --remove-source-files /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ /mnt/d/Workspace/General/Essential/Art/Media\ Screenshots/Pics --include=\[0-9]*.PNG --exclude=\*
        echo "=================================="
        echo -e '\n Finished!\n'
        # open "D:\Workspace\General\Essential\Art\Media Screenshots\Pics"
    elif [ $input -eq 11 ] ; then
        echo -e "\n Moving to Acer Screenshots....\n"
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-existing --remove-source-files /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ /mnt/d/Workspace/General/Tech/MEMORY/Desktop\ Screenshots/Acer\ Predator\ G9-792 --include=\Screen\ Shot*.PNG --exclude=\*
        echo "=================================="
        echo -e '\n Finished!\n'
    elif [ $input -eq 12 ] ; then
        echo -e "\n Moving to Surface Screenshots....\n"
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-existing --remove-source-files /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ /mnt/d/Workspace/General/Tech/MEMORY/Desktop\ Screenshots/Microsoft\ Surface\ Pro\ 4 --include=\Screen\ Shot*.PNG --exclude=\*
        echo "=================================="
        echo -e '\n Finished!\n'
    elif [ $input -eq 0 ] ; then
            :
    else
        move
    fi
}
#   -------------------------------
#   7.  Manage Notepad++ Configuration
#   -------------------------------
function nppfix (){
    clear
    echo -e '\n  Available Options:'
    echo -e '       0. Exit'
    echo -e '       1. Replace Corrupted Configuration'
    echo -e '       2. Backup Configuration\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        # Variables
        origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/ 
        destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/    
        # Function   
        echo -e "\n Replacing corrupted configuration....\n"
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-times "$origin" "$destination" --include=\*.xml --exclude=\*
        echo "=================================="
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
        echo "=================================="
        sudo rsync -avhz --progress --stats --ignore-times "$origin${Array1[0]}" "$origin${Array1[1]}" "$origin${Array1[2]}" "$origin${Array1[3]}" "$origin${Array1[4]}" "$origin${Array1[5]}" "$destination"
        echo "=================================="
        echo -e "\n Finished!\n"
    elif [ $input -eq 0 ] ; then
            :
    else
        nppfix
    fi
}
#   -------------------------------
#   8.  Launch X Sessions
#   -------------------------------
function xsession (){
    clear
    echo -e '\n  Available Options:'
    echo -e '       0. Exit'
    echo -e '       1. Launch Xfce4 Session'
    echo -e '       2. Launch i3-wm Session'
    echo -e '       3. Load X Server in Multi Window mode\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        echo -e "\n Launching xfce4....\n"
        echo "=================================="
        cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch & Reg\WSL\VcXsrv Config' /MAX configNormal.xlaunch
        cmd.exe /c start /D 'C:\Windows\System32\' bash.exe --login -c "sudo xfce4-session"
        echo -e "\n ....Xfce4 Session Started\n"
    elif [ $input -eq 2 ] ; then
        echo -e "\n Launching i3-wm....\n"
        echo "=================================="
        cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch & Reg\WSL\VcXsrv Config' /MAX configNormal.xlaunch
        cmd.exe /c start /D 'C:\Windows\System32\' bash.exe --login -c "sudo i3 "
        echo -e "\n ....i3-wm Session Started\n"
    elif [ $input -eq 3 ] ; then
        echo -e "\n Loading X Server in Multi Window mode....\n"
        cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch & Reg\WSL\VcXsrv Config' /MAX configMultiWindow.xlaunch
    elif [ $input -eq 0 ] ; then
            :
    else
        xsession
    fi
}
#   -------------------------------
#   9.  Update .dotfiles
#   -------------------------------
function dots(){
    echo -e '\n Removing old .dotfiles....\n'
    echo "=================================="
    sudo rm -rfv ~/.dotfiles 
    echo "=================================="
    echo -e '\n Cloning new .dotfiles....\n'
    echo "=================================="
    git clone /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/ ~/.dotfiles
    # oh-my-zsh
    sudo cp -rv /mnt/d/Workspace/Projects/Programing/Git/dotfiles/.dotfiles/wsl/shell/zsh/.oh-my-zsh ~/.dotfiles/wsl/shell/zsh/
    echo "=================================="
    echo -e '\n Converting .dotfiles to LF endings....\n'
    echo "=================================="
    sudo dos2unix ~/.dotfiles/wsl/*.* ~/.dotfiles/wsl/shell/zsh/.* ~/.dotfiles/wsl/shell/zsh/.oh-my-zsh-custom/.* ~/.dotfiles/wsl/shell/bash/.* ~/.dotfiles/wsl/editors/.* ~/.dotfiles/wsl/git/.* ~/.dotfiles/wsl/git/*.* ~/.dotfiles/wsl/bin/*
    echo "=================================="
    echo -e '\n Sourcing .dotfiles....\n'
    echo "=================================="
    sca
    echo "=================================="
    echo -e '\n Dotfiles Updated!\n'
}
#   -------------------------------
#   10.  List Git Branches on the local machine sorted by recent updates, adding a star to remote tracking branches
#   -------------------------------
function git_list_branches() {
  RED="\e[91m";
  for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add a red star to mark branches that are tracking something upstream
    tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED★"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
  done | sort;
}
#   -------------------------------
#   11.  Empty Windows Trash
#   -------------------------------
function e (){
    echo -e '\n Empting $RECYCLE.BIN....\n'
    cmd.exe /c 'D:\Workspace\Portable Apps\SyMenu\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe' emptybin
    # cmd.exe /c 'D:\Workspace\Portable Apps\By Category\File Management\Recycle\recycle.exe' /L
    # echo -e '\n Empting $RECYCLE.BIN on C:\ ....\n'
    # cmd.exe /c rd /s /q '%systemdrive%\$Recycle.bin'
    # echo -e '\n Empting $RECYCLE.BIN on D:\ ....\n'
    # cmd.exe /c rd /s /q 'D:\$Recycle.bin'
}
#   -------------------------------
#   12.  Windows File Handles
#   -------------------------------
function handles(){
    cd /mnt/d/Workspace/Portable\ Apps/SyMenu/ProgramFiles/SPSSuite/SysinternalsSuite/Handle_sps
    clear
    cmd.exe /c 'handle.exe /?'
    echo -e '\n  Available Options:'
    echo -e '       0. Exit'
    echo -e '       1. Show Handles for Particular Drive'
    echo -e '       2. Show All File Handles'
    echo -e '       3. Show All Process PIDs'
    echo -e '       4. Close Handles for F:\\\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        read -p "    Enter Drive Letter: " input2
        echo -e '\n Showing Handles for '$input2':\....\n'
        echo "=================================="
        cmd.exe /c 'handle.exe' | grep ''$input2':\\'
        # cmd.exe /c 'handle.exe | findstr /i d:\'
        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 2 ] ; then
        echo -e '\n Showing All File Handles....\n'
        cmd.exe /c 'handle.exe'
        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 3 ] ; then
        echo -e '\n Showing All Process PIDs....\n'
        cmd.exe /c 'handle.exe' | grep 'pid'
        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 0 ] ; then
            :
    else
        handles
    fi
}

function descriptors(){
    clear
    echo -e '\n  Available Options:'
    echo -e '       0. Exit'
    echo -e '       1. Show the number of All Open Descriptors'
    echo -e '       2. Show All Descriptors\n'
    read -p "  Enter Option: " input
    printf "\n"
    if [ $input -eq 1 ] ; then
        echo -e '\n Showing the number of All Open Descriptors....\n'
        echo "=================================="
        echo -e "\n     The number of all open descriptors is: $(lsof | wc -l)\n"
        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 2 ] ; then
        echo -e '\n Showing All Descriptors....\n'
        echo "=================================="
        # lsof
        ls /proc/*/fd
        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 3 ] ; then
        echo -e '\n Showing Handles for F:\....\n'

        echo "=================================="
        echo -e '\n ....Query Completed!\n'
    elif [ $input -eq 0 ] ; then
            :
    else
        descriptors
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
function whois() {
  local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
  if [ -z $domain ] ; then
    domain=$1
  fi
  echo "Getting whois record for: $domain …"

  # avoid recursion
          # this is the best whois server
                          # strip extra fluff
  /usr/bin/whois -h whois.internic.net $domain -H # | sed '/NOTICE:/q'
}

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
      read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
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
#     echo "=================================="
#     cmd.exe /c ROBOCOPY 'C:\Users\Todorov\Downloads' 'D:\Workspace\_TEMP' * /MOVE /E /COPY:DAT /DCOPY:DAT /XF *.ini
#     echo "=================================="
#     echo -e "\n Moving from Documents....\n"
#     echo "=================================="  
#     cmd.exe /c ROBOCOPY 'C:\Users\Todorov\Documents' 'D:\Workspace\_TEMP' * /MOV /COPY:DAT /XF *.ini
#     echo "=================================="
#     echo -e "\n Finished\n"
# }

# Rsync
# function mvall(){
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t /mnt/d/Workspace/_TEMP
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} /mnt/d/Workspace/_TEMP
#     find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} /mnt/d/Workspace/_TEMP \;
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