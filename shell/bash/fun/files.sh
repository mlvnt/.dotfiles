#!/bin/bash

#█▓▒░ folder - create folder sequences -----------------------------------------

folder() {
    help() {
        clear && echo && echo "DESCRIPTION";
        echo "        folder - create folder sequences" && echo;
        echo "USAGE";
        echo "        folder [RANGE] [NAME]" && echo;
        echo "OPTIONS";
        echo "        RANGE     number of folders";
        echo "        NAME      folder prefix" && echo;
    }

    local end="$1";
    local name="${2:-folder}";
    gen() {
        for i in $(seq 1 ${end}); do
            mkdir -v "${name} $i";
        done;
    }

    case $1 in
        ""|help) help ;;
        *) gen ;;
    esac;

    unset help gen;
}

#█▓▒░ manage file handles / descriptors ----------------------------------------

handles() {
    pushd ${local}/pc/apps/suites/symenu/ProgramFiles/SPSSuite/SysinternalsSuite/Handle_sps;
    help() {
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
    }

    if [ -z $1 ] ; then
        help
    else
        input=$1;
    fi

    case $input in
        1)  clear
            read -e -p "    Enter Drive Letter: " input2
            echo -e '\n ~~~~~~~~~~~~~~ Showing Handles for '$input2':\.... ~~~~~~~~~~~~~~\n'
            cmd.exe /c 'handle.exe' | grep ''$input2':\\'
            # cmd.exe /c 'handle.exe | findstr /i D:\'
            echo -e '\n ~~~~~~~~~~~~~~ Query Completed! ~~~~~~~~~~~~~~\n' ;;
        2)  clear
            echo -e '\n ~~~~~~~~~~~~~~ Showing All File Handles.... ~~~~~~~~~~~~~~\n'
            cmd.exe /c 'handle.exe'
            echo -e '\n ~~~~~~~~~~~~~~ Query Completed! ~~~~~~~~~~~~~~\n' ;;
        3)  clear
            echo -e '\n ~~~~~~~~~~~~~~ Showing All Process PIDs.... ~~~~~~~~~~~~~~\n'
            cmd.exe /c 'handle.exe' | grep 'pid'
            echo -e '\n ~~~~~~~~~~~~~~ Query Completed! ~~~~~~~~~~~~~~\n' ;;
        4)  cmds "$(wslpath -w ${local})\pc\apps\suites\symenu\ProgramFiles\SPSSuite\SysinternalsSuite\Process_Explorer_sps" procexp64.exe && clear ;;
        5)  cmd.exe /c handle.exe /? ;;
        6)  clear
            echo -e "\n     The number of all open descriptors is: $(lsof | wc -l)\n" ;;
        7)  echo -e '\n ~~~~~~~~~~~~~~ Showing All Descriptors.... ~~~~~~~~~~~~~~\n'
            # lsof
            ls /proc/*/fd
            echo -e '\n ~~~~~~~~~~~~~~ Query Completed! ~~~~~~~~~~~~~~\n' ;;
        b)  manage ;;
        x)  : && clear ;;
        *)  handles ;;
    esac

    functions=(
        "help"
    )

    variables=(
        "input"
        "input2"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
    popd;
}

#█▓▒░ manage links -------------------------------------------------------------

links() {
    help() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x | Exit'
        echo    '           b | Go Back'
        echo    '       Generate Symbolic Links from a list:'
        echo    '           1 | Delete at script directory'
        echo    '           2 | Create Links at script directory'
        echo    '           3 | Create Links at custom directory'
        echo    '       Generate Symbolic Links:'
        echo    '         Linux:'
        echo    '           4 | Create'
        echo    '         Windows:'
        echo    '           5 | Create Link for Files'
        echo -e '           6 | Create Link for Directory\n'
        read -e -p "  Enter Option: " input
        echo
    }

    # Delete Specified symbilic links
    delsymb() {
        echo -e '\n ~~~~~~~~~~~~~~ Deleting Symbolic Links.... ~~~~~~~~~~~~~~\n'
        find -type l -print | while IFS= read -r lnk; do
          if readlink "${lnk}" | grep '/mnt/' ; then
            rm -v "${lnk}"
          fi
        done;
        echo -e '\n ~~~~~~~~~~~~~~ Symbolic Links Deleted! ~~~~~~~~~~~~~~\n'
    }

    local path="${python}/scripts/system/genlinks/links"
    local pathwin="$(wslpath -w ${python})\scripts\system\genlinks\links"

    if [ -z $1 ] ; then
        help
    else
        input=$1
    fi

    case $input in
        1)  pushd "${path}" && delsymb && popd; ;;
        2)  pushd "${path}";
            [ -z $1 ] || shift 1;
            python3 -c "exec(\"from scripts import symblink\nsymblink.main()\")" "$@";
            o ${pathwin} && popd; ;;
        3)  [ -z $1 ] || shift 1;
            python3 -c "exec(\"from scripts import symblink\nsymblink.main()\")" "$@"; ;;
        4)
            read -e -p "    Enter Target: " target
            read -e -p "    Enter Link Name: " linkname
            echo -e '\n ~~~~~~~~~~~~~~ [link] '${linkname}' -> '${target}' ~~~~~~~~~~~~~~\n'
            ln -sv ${target} ${linkname}
            echo '' ;;
        5)
            read -e -p "    Enter Target: " -r target
            read -e -p "    Enter Link Name: " -r linkname
            yecho -e '\n ~~~~~~~~~~~~~~ [link] '${linkname}' -> '${target}' ~~~~~~~~~~~~~~\n'
            # lnk='cmd.exe /c mklink'
            cmd.exe /c mklink ${linkname} ${target}
            echo '' ;;
        6)
            read -e -p "    Enter Target: " -r target
            read -e -p "    Enter Link Name: " -r linkname
            echo -e '\n ~~~~~~~~~~~~~~ [link] '${linkname}' -> '${target}' ~~~~~~~~~~~~~~\n'
            cmd.exe /c mklink /D ${linkname} ${target}
            echo '' ;;
        b)  manage ;;
        x)  : && clear ;;
        *)  links ;;
    esac

    functions=(
        "help"
        "delsymb"
    )

    variables=(
        "input"
        "lnk"
        "target"
        "linkname"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

#█▓▒░ Determine size of a file or total size of a directory --------------------

filesize() {
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

#█▓▒░ convert windows to wsl path and viceverca
# alias  - gethpath

getpath() {
    help() {
        echo && echo "DESCRIPTION"
        echo "        getpath - convert and copy path to clipboard" && echo
        echo "USAGE"
        echo "        getpath [OPTIONS] path" && echo
        echo "OPTIONS"
        echo "     -w                convert to windows format"
        echo "     -u                convert to unix format"
        echo "     -c                current directory"
        echo "     -h | help         show help" && echo
    }
    local os=$(currentdevice -o);
    local re='(^-[c])';

    if [[ $os == win ]]; then
        local clipboard="cmd.exe /c clip";
    else
        local clipboard="xclip -sel clip";
    fi;

    if [[ $1 =~ $re ]]; then
        local input="$(pwd)";
        shift 1
    elif [[ $2 =~ $re ]]; then
        local input="$(pwd)";
    else
        local input="$2";
    fi;

    case $1 in
        -w) wslpath -w "$input";
            wslpath -w "$input" | tr -d '\n' | ${clipboard}; ;;
        -u) wslpath -u "$input";
            wslpath -u "$input" | tr -d '\n' | ${clipboard}; ;;
        *)  help ;;
    esac
    unset -f help;
}

# Copy w/ progress
cp_p() { rsync -WavP --human-readable --progress $1 $2; }

filec() {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        filec - list number of files in a directory" && echo
        echo "USAGE"
        echo "        filc [OPTION]" && echo
        echo "OPTIONS"
        echo "        a, all"
        echo "              include hidden" && echo
    }

    if [ -z $1 ] ; then
        raw=$(ls -l | wc -l);
        num=$(echo $raw | awk '{ print $NF}');
        echo "$num - 1" | bc
    else
        case $1 in
            a|all)
                raw=$(ls -al | wc -l);
                num=$(echo $raw | awk '{ print $NF}');
                echo "$num - 3" | bc -l ;;
            *)  help ;;
        esac
    fi

    functions=(
        "help"
    )

    variables=(
        "raw"
        "num"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

openfile() {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        openfile - open a file" && echo
        echo "USAGE"
        echo "        openfile [file] [command]"
        echo "        openfile [command] [file]" && echo
        echo "OPTIONS"
        echo "     -s                open with sublime"
        echo "     -v                open with vscode"
        echo "     -d                open with default program"
        echo "     -h | help         show help" && echo
    }

    local re='(^-[shd])'

    if [[ $1 =~ $re ]]; then
        local cmd="$1"
        local input="$2"
    elif [[ $2 =~ $re ]]; then
        local input="$1"
        local cmd="$2"
    elif [[ -z $2 ]]; then
        local cmd="-d"
        local input="$1"
    else
        local status="$(ls -al | grep $1)"
        if [[ ! -z  $status ]]; then
            $(ls -al | grep $1)
            local cmd="$2"
            local input="$1"
        else
            local cmd="$1"
            local input="$2"
        fi
    fi

    case $cmd in
        -s)         sublime $(wslpath -w $(pwd)/$input) ;;
        -v)         code $(wslpath -w $(pwd)/$input) ;;
        -d)         explorer.exe $(wslpath -w $(pwd)/$input) ;;
        -h|help)    help ;;
        *)          "$cmd" $(wslpath -w $(pwd)/$input) ;;
    esac
    unset -f help;
}

# find shorthand
findname() {
  find . -name "$1" 2>&1 | grep -v 'Permission denied'
}

# List all files, long format, colorized, permissions in octal
la() {
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

gdiff () {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        gdiff - show differences between 2 files" && echo
        echo "USAGE"
        echo "        gdiff [command] [file1...]" && echo
        echo "OPTIONS"
        echo "     -s                show status only"
        echo "     -p                diff from clipboard"
        echo "     -t                diff from /tem (old clipboard)"
        echo "     -g                diff graphical"
        echo "     -a                diff the difference (only additions)"
        echo "     -h | help         show help" && echo
    }

    cattemp() {
        # local i=5
        # local input=${1:-0}
        # local n=$(echo "$i + $input" | bc -l )
        # cat > /temp/f${n}
        echo "    Ctrl + D on new line to save"
        echo "    Paste 1"
        pushd /tmp
        cat > f1;
        read -e -p "    Paste 2 [y]: " input
        case $input in
            y|Y)  cat > f2 && clear; ;;
            *)    echo "    aboring"
        esac;
        popd
    }

    dodiff() {
        if [[ "$(status "$@")" == 'differ' ]]; then
            diff -u "$@" | colordiff | less -R;
        else
            status "$@";
        fi;
    }

    status() {
        echo "$(diff -sq $@ | awk '{print $NF}')";
    }

    if [[ -z "$@" ]]; then
        help
    else
        local input="$1";
        local temp1="/tmp/f1";
        local temp2="/tmp/f2";
        case $input in
            -t)         shift 1;
                        case "$1" in
                             -s) gdiff -s "$temp1" "$temp2"; ;;
                             *)  gdiff "$temp1" "$temp2"; ;;
                         esac ;;
            -g)         cmds "$(wslpath -w $local)\pc\apps\productivity\diff-checker-x64.nsis" Diff-Checker.exe; ;;
            -s)         shift 1 && status "$@"; ;;
            -p)         shift 1 && cattemp;
                        gdiff "$temp1" "$temp2"; ;;
            -a)         shift 1 && cattemp;
                        diff -u "$temp1" "$temp2" | grep '^\+' | sed -E 's/^\+//'; ;;
            -h|help)    help ;;
            *)          dodiff "$@"; ;;
        esac;
    fi;
    unset -f help cattemp dodiff;
}

#   -------------------------------
#   Empty Trash
#   -------------------------------

bin() {
    patht="$aps\suites\symenu\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe"
    trashdir=~/.local/share/Trash

    list() {
        help() {
            clear && echo
            echo    '         x | Exit'
            echo    '         b | Go Back'
            echo    '         1 | List All'
            echo -e '         2 | Search For\n'
            read -e -p "  Option: " input
        }
        help

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

    empty() {
        help() {
            clear && echo && sudo trash-list && echo
            echo    '         x | Exit'
            echo    '         b | Go Back'
            echo    '         1 | Empty'
            echo -e '         2 | Remove Selected\n'
            read -e -p "  Option: " input
        }
        help

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

    help() {
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
    }
    help

    case $input in
        1)
            echo -e '\n Empting $RECYCLE.BIN....\n'
            cmd.exe /c "$patht" emptybin ;;
            # cmd.exe /c 'D:\apps\File Management\Recycle\recycle.exe' /L
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

    functions=(
        "help"
        "list"
        "empty"
    )

    variables=(
        "input"
        "patht"
        "trashdir"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}
