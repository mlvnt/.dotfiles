###############################################################################
# FUNCTIONS                                                                   #
###############################################################################

#   -------------------------------
#   1.  DIRECTORIES
#   -------------------------------

# Open multiple word documets
function wordn (){
    echo ''
    read -p "Enter № of word documents to open: " number
    printf "\n"
    for (( c=1; c<=number; c++ ))
    do  
       echo "Opening word document $c...."
       word
       sleep 1s
    done
}

# Start Clash of Clans Bot
function coc (){
    echo -e "\n Opening Clash of Clans Bot....\n"
    timeout 1s cmd.exe /c 'C:\Users\Todorov\Desktop\MyBotRun - MBR\MyBot-MBR_v7.2.5\MyBot.run.exe' MyVillage1 MEmu MEmu_2
}

# Move all from Windows temporary direcories
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
function mvall(){
    # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t /mnt/d/Workspace/_TEMP
    # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} /mnt/d/Workspace/_TEMP
    # find /mnt/c/Users/Todorov/Downloads -mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} /mnt/d/Workspace/_TEMP \;
    echo -e "\n Moving from Downloads....\n"
    echo "=================================="
    rsync -avhz --progress --ignore-existing --remove-source-files --exclude *.ini /mnt/c/Users/Todorov/Downloads/ /mnt/d/Workspace/_TEMP
    find /mnt/c/Users/Todorov/Downloads/ -depth -type d -empty -delete
    echo "=================================="
    echo -e "\n Moving from Documents....\n"
    echo "=================================="
    rsync -avhz --progress --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\* /mnt/c/Users/Todorov/Documents/ /mnt/d/Workspace/_TEMP
    echo "=================================="
    echo -e "\n Finished\n"
}

# Move Anime Pics to permanent directory
function mvpics(){
    echo -e "\n Moving to Anime Pics....\n"
    echo "=================================="    
    rsync -avhz --progress --ignore-existing --remove-source-files /mnt/c/Users/Todorov/Pictures/My\ Screen\ Shots/ /mnt/d/Workspace/General/Essential/Art/Media\ Screenshots/Pics --include=\*.PNG --exclude=\*
    echo "=================================="
    echo -e "\n Finished\n"
    # open "D:\Workspace\General\Essential\Art\Media Screenshots\Pics"
}

# Fix deleted configuration on Notepad++
function nppf(){
    # Variables
    origin=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/_Backup/ 
    destination=/mnt/d/Workspace/Portable\ Apps/PortableApps.com/PortableApps/Notepad++Portable/App/Notepad++/    
    # Function   
    echo -e "\n Replacing corrupted configuration....\n"
    echo "=================================="
    rsync -avhz --progress --ignore-times "$origin" "$destination" --include=\*.xml --exclude=\*
    echo "=================================="
    echo -e "\n Finished\n"    
    echo -e "\nOpening Notepad++....\n"
    npp
}

# Backup Notepad++ Configuration
function nppb(){
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
    rsync -avhz --progress --ignore-times "$origin${Array1[0]}" "$origin${Array1[1]}" "$origin${Array1[2]}" "$origin${Array1[3]}" "$origin${Array1[4]}" "$origin${Array1[5]}" "$destination"
    echo "=================================="
    echo -e "\n Finished\n"         
}

function xfces(){
    echo -e "\n Starting xfce4....\n"
    echo "=================================="   
    cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch\WSL\VcXsrv Config' /MAX configNormal.xlaunch
    cmd.exe /c start /D 'C:\Windows\System32\' bash.exe --login -c xfce4-session
    echo "=================================="
    echo -e "\n Session Started\n"        
}

function i3s(){
    echo -e "\n Starting i3....\n"
    echo "=================================="   
    cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch\WSL\VcXsrv Config' /MAX configNormal.xlaunch
    cmd.exe /c start /D 'C:\Windows\System32\' bash.exe --login -c "sudo i3 "
    echo "=================================="
    echo -e "\n Session Started\n"        
}

function multis(){
    cmd.exe /c start /D 'D:\Workspace\Projects\Programing\Scripts\Scripts\Batch\WSL\VcXsrv Config' /MAX configMultiWindow.xlaunch
}

#=========================================================================================
#=========================================================================================
#=========================================================================================

# Create a new directory and enter it
function mkd() {
    mkdir -p "$@" && cd "$_";
}

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