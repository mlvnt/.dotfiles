#!/bin/bash

wslpath() {
    # https://github.com/darealshinji/scripts/blob/master/wslpath
    # Author: djcj <djcj@gmx.de>

    local last=${!#};
    local filename=${FUNCNAME[0]};

    print_usage() {
cat << EOL
usage:
${filename} [-u|-w|-m] [-a] path
${filename} -h|--help
Convert Unix and Windows format paths.
Output type options:
  -u, --unix        (default) print Unix form of NAMEs (/mnt/c/Windows)
  -w, --windows     print Windows form of NAMEs (C:\\Windows)
  -m, --mixed       like --windows, but with regular slashes (C:/Windows)
Path conversion options:
  -r, --realpath    output absolute path with resolved symbolic links
  -s, --subst-home  substitute Unix HOME path with Windows user path
Other options:
  -h, --help        output usage information and exit
EOL
        return $1;
    }

    checkarg() {
        if [ "$1" = "$last" ]; then
            echo "Error: missing path argument"
            return 1;
        fi
    }

    win_env() {
        echo $(cmd.exe /C echo %${1}% 2>/dev/null | sed -e 's|\r||;s|\\|/|g');
    }

    if ! ( grep -q 'Microsoft' /proc/version 2>/dev/null || \
    grep -q 'Microsoft' /proc/sys/kernel/osrelease 2>/dev/null ) ; then
        echo "Warning: script was made for \"Bash on Windows\"" > /dev/stderr;
    fi;

    # Currently only support Debian or Ubuntu images for WSL

    local myos=$(grep '^ID=' /etc/os-release | cut -f2 -d\=)
    if [[ $myos = debian ]] ; then
        local lxss=$(win_env LOCALAPPDATA)/Packages/TheDebianProject.DebianGNULinux_76v4gfsz19hv4/LocalState
    elif [[ $myos = ubuntu ]] ; then
        local lxss=$(win_env LOCALAPPDATA)/Packages/CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc/LocalState
    else
        echo "Warning: wslpath only supports debian and ubuntu images. (OS found: $myos)" > /dev/stderr
    fi;

    if [ -z "$1" ]; then
        print_usage 1;
    fi;

    local to_unix=yes;
    local mixed_mode=no;
    local realpath=no;
    local subst_home=no;

    while [[ $# -gt 0 ]]; do
        case $1 in
        -w|--windows)
            to_unix=no
            checkarg $1
            ;;
        -u|--unix)
            to_unix=yes
            checkarg $1
            ;;
        -m|--mixed)
            to_unix=no
            mixed_mode=yes
            checkarg $1
            ;;
        -r|--realpath)
            realpath=yes
            checkarg $1
            ;;
        -s|--subst-home)
            subst_home=yes
            ;;
        -h|--help)
            print_usage 0
            ;;
        *)
            ;;
        esac;
        shift;
    done;

    local p=$(echo $last | sed -e 's|\\\+|/|g;s|/\+|/|g');

    if [ $subst_home = yes ] && [ $to_unix = no ]; then
        local userprofile=$(win_env USERPROFILE);
        local drive=${userprofile:0:1};
        local win_home=/mnt/${drive,,}${userprofile:2};
    fi

    if [ $to_unix = yes ]; then
        # windows to unix
        local lxssLen=$(echo $lxss | wc -m);
        if [ "${p:0:$lxssLen}" = "$lxss" ]; then
            local subdir=$(echo $p | cut -d'/' -f7);
            local lxssDirs=$(grep -e ' lxfs ' /proc/mounts | awk '{print $1}');
            if [ -n "$(echo $lxssDirs | tr ' ' '\n' | grep -e "^$subdir\$")" ]; then
                local offset=$(echo $lxss/$subdir | wc -m);
                local prefix=$(grep -e "^$subdir " /proc/mounts | awk '{print $2}');
                [ "$prefix" != / ] || prefix=""
                local p=$prefix${p:$offset}
            fi;
        fi;
        if [ -n "$(echo ${p:0:3} | grep -e '^[A-Za-z]:/\?$')" ]; then
            local drive=${p:0:1};
            local p=/mnt/${drive,,}${p:2};
        fi;
        if [ $realpath = yes ]; then
            local p=$(realpath -m "$p");
        fi;
    else
        # unix to windows
        if [ $realpath = yes ]; then
            local p=$(realpath -m "$p");
        fi;
        if [ "${p:0:1}" = / ]; then
            if [ $subst_home = yes ]; then
                p=$(echo $p | sed "s|^$HOME|$win_home|");
            fi;
            if [ -n "$(echo ${p:0:7} | grep -e '^/mnt/[a-z]/\?$')" ]; then
                local drive=${p:5:1};
                local p=${drive^^}:${p:6};
            elif [ -n "$(echo ${p:0:3} | grep -e '^/[a-z]/\?$')" ]; then
                local drive=${p:1:1};
                local p=${drive^^}:${p:2};
            else
                local firstDir=/$(echo $p | cut -d'/' -f2);
                local offset=$(printf "$firstDir" | wc -m);
                local rootDirs=$(grep -e ' lxfs ' /proc/mounts | awk '{print $2}');
                    if [ -z "$(echo $rootDirs | tr ' ' '\n' | grep -e "^$firstDir\$")" ]; then
                        local firstDir=/;
                        local offset=0;
                    fi;
                local p=$lxss/$(grep -e " $firstDir " /proc/mounts | awk '{print $1}')${p:$offset}
            fi;
        fi;
        if [ $mixed_mode = no ]; then
            local p=$(echo $p | tr '/' '\\');
        fi;
    fi;

    unset print_usage checkarg win_env;
    echo "${p}";
}
