#!/bin/bash
# ┏━┓┏┓┓┳  ┏━┓┳━┓┳━┓  ┳━┓┳ ┓┏┓┓┏━┓┏┓┓o┏━┓┏┓┓┓━┓
# ┃ ┃┃┃┃┃  ┃ ┃┃━┫┃ ┃  ┣━ ┃ ┃┃┃┃┃   ┃ ┃┃ ┃┃┃┃┗━┓
# ┛━┛┇┗┛┇━┛┛━┛┛ ┇┇━┛  ┇  ┇━┛┇┗┛┗━┛ ┇ ┇┛━┛┇┗┛━━┛

#█▓▒░ sca - source all ---------------------------------------------------------

sca() {
    # Shell dotfiles
    local files=(
        "bash_onload"
        "bashrc"
        # "bash_aliaswin"
        "bash_var"
        "bash_alias"
        "bash_env"
        "bash_fun"
        "fzf.bash" # fzf - A command-line fuzzy finder
        # "tmux.conf"
        # "zshrc"
        # "yarnrc"
        # "npmrc"
        # "vimrc"
        # "bash_private"
        # "bash-powerline.sh"
        # "rvm/scripts/rvm"
    );
    local dirs=(
        "$HOME"
    )
    local printing="false";

    sc() {
        # Load the shell dotfiles
        [ "$printing" == "true" ] && printf "\n";
        for f in "${files[@]}"; do
            local f="$HOME/.$f"
            if [ -r "$f" ] && [ -f "$f" ]; then
                if [ "$f" == "$HOME/.tmux.conf" ]; then
                    tmux source-file "$f";
                    [ "$printing" == "true" ] && printf "[sourcing] $f\n";
                else
                    . "$f";
                    [ "$printing" == "true" ] && printf "[sourcing] $f\n";
                fi
            else
                printf "404: $f not found.\n";
            fi
        done;
        [ "$printing" == "true" ] && printf "\n";
    }

    case $1 in
        i)  local files=( "${files[@]:2}" );
            local dirs( "${dirs[@]}" );
        sc ;;
        f)  shift 1
            local files=( "$@" );
            local dirs( "$@" );
        sc ;;
        help) help ;;
        *)  local files=( "${files[1]}" );
            local printing="true";
        sc ;;
    esac

    # clear
    unset help sc;
}

#█▓▒░ currentdevice - get stats about the current device -----------------------

deviceinfo() {
    help() {
        echo && echo "DESCRIPTION"
        echo "        deviceinfo - show info about current device" && echo
        echo "USAGE"
        echo "        deviceinfo [OPTION]" && echo
        echo "OPTIONS"
        echo "     -a     show architecture"
        echo "     -c     show current device"
        echo "     -di    show distribution id"
        echo "     -dn    show distribution name"
        echo "     -h     show device hostname"
        echo "     -ipl   show local ip"
        echo "     -ipp   show public ip"
        echo "     -kn    show kernel id"
        echo "     -kv    show kernel version"
        echo "     -m     show device model"
        echo "     -mem   show memory"
        echo "     -o     show operating system"
        echo "     -p     show package manager"
        echo "     -u     show current user"
        echo "     -up    show uptime"
        echo "     -help  show help" && echo
    }

    get_uptime() {
        # Get uptime in seconds.
        if [[ -r /proc/uptime ]]; then
            local seconds="$(< /proc/uptime)"
            local seconds="${seconds/.*}"
        else
            local boot="$(date -d"$(uptime -s)" +%s)"
            local now="$(date +%s)"
            local seconds="$((now - boot))"
        fi

        days="$((seconds / 60 / 60 / 24)) days"
        hours="$((seconds / 60 / 60 % 24)) hours"
        mins="$((seconds / 60 % 60)) minutes"

        # Remove plural if < 2.
        ((${days/ *} == 1))  && days="${days/s}"
        ((${hours/ *} == 1)) && hours="${hours/s}"
        ((${mins/ *} == 1))  && mins="${mins/s}"

        # Hide empty fields.
        ((${days/ *} == 0))  && unset days
        ((${hours/ *} == 0)) && unset hours
        ((${mins/ *} == 0))  && unset mins

        local uptime="${days:+$days, }${hours:+$hours, }${mins}"
        local uptime="${uptime%', '}"
        local uptime="${uptime:-${seconds} seconds}"

        # Make the output of uptime smaller.
        local uptime="${uptime/minutes/mins}"
        local uptime="${uptime/minute/min}"
        local uptime="${uptime/seconds/secs}"

        echo ${uptime}
    }

    get_memory() {
        # MemUsed = Memtotal + Shmem - MemFree - Buffers - Cached - SReclaimable
        # Source: https://github.com/KittyKatt/screenFetch/issues/386#issuecomment-249312716
        while IFS=":" read -r a b; do
            case "$a" in
                "MemTotal") ((mem_used+=${b/kB})); mem_total="${b/kB}" ;;
                "Shmem") ((mem_used+=${b/kB}))  ;;
                "MemFree" | "Buffers" | "Cached" | "SReclaimable")
                    mem_used="$((mem_used-=${b/kB}))"
                ;;
            esac
        done < /proc/meminfo

        mem_used="$((mem_used / 1024))"
        mem_total="$((mem_total / 1024))"
    ((mem_perc=mem_used * 100 / mem_total))

        memory="${mem_used}${mem_label:-MiB} / ${mem_total}${mem_label:-MiB} ${mem_perc:+(${mem_perc}%)}"

        echo $memory
    }

    get_model() {
        if [[ -f "/sys/devices/virtual/dmi/id/product_name" ||
                -f "/sys/devices/virtual/dmi/id/product_version" ]]; then
            local model="$(< /sys/devices/virtual/dmi/id/product_name)"
            local model+=" $(< /sys/devices/virtual/dmi/id/product_version)"
        elif [[ -f "/tmp/sysinfo/model" ]]; then
            local mode="Not Found"
        fi

        # Remove dummy OEM info.
        local model="${model//To be filled by O.E.M.}"
        local model="${model//To Be Filled*}"
        local model="${model//OEM*}"
        local model="${model//Not Applicable}"
        local model="${model//System Product Name}"
        local model="${model//System Version}"
        local model="${model//Undefined}"
        local model="${model//Default string}"
        local model="${model//Not Specified}"
        local model="${model//Type1ProductConfigId}"
        local model="${model//INVALID}"
        local model="${model//�}"

        echo "$model"
    }

    get_public_ip() {
        if type -p dig >/dev/null; then
            public_ip="$(dig +time=1 +tries=1 +short myip.opendns.com @resolver1.opendns.com)"
        [[ "$public_ip" =~ ^\; ]] && unset public_ip
        fi

        if [[ -z "$public_ip" ]] && type -p drill >/dev/null; then
            public_ip="$(drill myip.opendns.com @resolver1.opendns.com | \
                        awk '/^myip\./ && $3 == "IN" {print $5}')"
        fi

        if [[ -z "$public_ip" ]] && type -p curl >/dev/null; then
            public_ip="$(curl --max-time "$public_ip_timeout" -w '\n' "$public_ip_host")"
        fi

        if [[ -z "$public_ip" ]] && type -p wget >/dev/null; then
            public_ip="$(wget -T "$public_ip_timeout" -qO- "$public_ip_host")"
        fi
        echo $public_ip
    }

    get_local_ip() {
        local_ip="$(ip route get 1 | awk -F'src' '{print $2; exit}')"
        local_ip="${local_ip/uid*}"
        [[ -z "$local_ip" ]] && local_ip="$(ifconfig -a | awk '/broadcast/ {print $2; exit}')"
        echo $local_ip
    }

    local arch=$(uname -m); # x86_64, i*86, aarch64, armv8l
    local distribution_id=$(. /etc/os-release 2>/dev/null && echo ${ID});
    local distribution_name=$(. /etc/os-release 2>/dev/null && echo ${PRETTY_NAME});
    local hostname=$(hostname); # uname -n
    local kernel_name=$(uname -s);
    local kernel_version=$(uname -r);
    local os=$(uname -a | grep -qw 'Microsoft' && echo "win" || echo "unix");
    local user=$(whoami);
    local uptime=$(get_uptime);
    local model=$(get_model);
    local memory=$(get_memory);
    local public_ip=$(get_public_ip);
    local local_ip=$(get_local_ip);

    case "${distribution_id}" in
        centos|fedora) : "rpm;dnf"; ;;
        manjaro|arch)  : "pacman;yay"; ;;
        ubuntu|debian) : "apt;dpkg"; ;;
        *)
            printf '%s\n' "Unknown OS detected: '$distribution_id', aborting..." >&2
            printf '%s\n' "Open an issue on GitHub to add support for your OS." >&2
            exit 1 ;;
    esac;
    local package_manager="$_";

    case "$kernel_name" in
        "Linux"|"GNU"*) : "Linux" ;;
        *"BSD"|"DragonFly"|"Bitrig") : "BSD" ;;
        *)
            printf '%s\n' "Unknown OS detected: '$kernel_name', aborting..." >&2
            printf '%s\n' "Open an issue on GitHub to add support for your OS." >&2
            exit 1
        ;;
    esac;
    local kernel_name="$_";

    case ${user} in
        mlvnt)
            case ${hostname} in
                remote) : "remote" ;;
                pc)     : "pc" ;;
            esac; ;;
        u0_a530)    : "mobile" ;;
        u0_a157)
            case ${arc} in
                aarch64) : "mobile" ;;
                armv8l)  : "tab" ;;
            esac; ;;
        root)
            case ${hostname} in
                remote)     : "remote" ;;
                pc)         : "pc" ;;
                localhost)  : "mobile" ;;
            esac; ;;
    esac;
    local current_device="$_";

    case $1 in
        -a)       echo "${arch}" ;;
        -c)       echo "${current_device}" ;;
        -di)      echo "${distribution_id}" ;;
        -dn)      echo "${distribution_name}" ;;
        -h)       echo "${hostname}" ;;
        -ipl)     echo "${local_ip}" ;;
        -ipp)     echo "${public_ip}" ;;
        -kn)      echo "${kernel_name}" ;;
        -kv)      echo "${kernel_version}" ;;
        -m)       echo "${model}" ;;
        -mem)     echo "${memory}" ;;
        -o)       echo "${os}" ;;
        -p)       echo "${package_manager}" ;;
        -u)       echo "${user}" ;;
        -up)      echo "${uptime}" ;;
        -help|*)  help ;;
    esac;
    unset -f help get_uptime;
}

#█▓▒░ path_converter - get windows paths ---------------------------------------

path_converter() {
    new_path=$(cmd.exe /c "echo $@" 2>&1 | tr -d "\r\n");
    echo "$new_path";
}

#█▓▒░ tmux_workspace - tmux default workspace ----------------------------------

tmux_workspace() {
    local process=$(ps -e);
    local tasks=$(cmd.exe /c tasklist);
    # echo ${process} | grep -qw sshd && local sshd="ls" || local sshd="send-keys -t workspace:1.1 'sudo /usr/sbin/sshd' Enter";
    # echo ${process} | grep -qw dbus && local dbus="ls" || local dbus="send-keys -t workspace:1.1 'sudo /etc/init.d/dbus start' Enter";
    # tmux set -g base-index 1;
    # tmux new-window -n 'whole';
    # tmux select-window -t 1;
    # tmux select-pane -t 0;
    # neofetch; fzf;
    # echo ${tasks} | grep -qw 'MyBot.run' || tmux send-keys -t 2.0 'coc' Enter;
    # tmux new-window -n 'todo' \; split-window \; split-window \;
    # tmux select-layout tiled;
    # tmux switch -t workspaces:2;
    # split-window -d -t workspace:1 -v -p 50 \; \
    # split-window -d -t workspace:2 -v -p 50 \; \
    # resize-pane -t workspace:1.0 -Z\; \
    # resize-pane -t workspace:2.0 -Z\; \
    # target format:  -t [session]:[window number].[pane number]
    #  ${sshd} 1>/dev/null \; \
    #  ${dbus} 1>/dev/null \; \

    tmux new-session -d -s "workspace"\; \
    new-session -d -s "notes"\; \
    new-window -d -t workspace:2 \; \
    new-window -d -t workspace:3\; \
    rename-window -t notes:1 'todo.txt'\; \
    send-keys -t workspace:2 'update' Enter\; \
    send-keys -t workspace:3 'ipython3' Enter\; \
    send-keys -t notes:1 'todo' Enter;

    echo ${process} | grep -qw sshd || tmux send-keys -t workspace:2 'sudo /usr/sbin/sshd' Enter;
    echo ${process} | grep -qw dbus || tmux send-keys -t workspace:2 'sudo /etc/init.d/dbus start' Enter;

    if [[ $(currentdevice) == pc ]]; then
        tmux new-session -d -s "logging"\; \
        new-window -d -t logging:2 \; \
        rename-window -t logging:1 'linkbox'\; \
        rename-window -t logging:2 'radicale'\; \
        send-keys -t logging:1.0 'lin' Enter\; \
        send-keys -t logging:2.0 'radicalle run' Enter;
    fi;
    tmux attach -t workspace:1;
}
