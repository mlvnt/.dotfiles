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

currentdevice() {
    help() {
        echo && echo "DESCRIPTION"
        echo "        currentdevice - show info about current device" && echo
        echo "USAGE"
        echo "        currentdevice [OPTION]" && echo
        echo "OPTIONS"
        echo "    -hn           show device hostname"
        echo "     -u           show current user"
        echo "     -o           show operating system"
        echo "     -h | help    show help" && echo
    }

    local user=$(whoami);
    local hostname=$(hostname); # uname -n
    local os=$(uname -a | grep -qw 'Microsoft' && echo "win" || echo "unix");
    case $1 in
        -hn)        echo "$hostname" ;;
        -u)         echo "$user" ;;
        -o)         echo "$os" ;;
        -h|help)    help ;;
        *)
            case $user in
                mlvnt)
                            case $hostname in
                                remote) echo "remote" ;;
                                pc) echo "pc" ;;
                            esac; ;;
                u0_a530)    echo "mobile" ;;
                u0_a105)    echo "tab" ;;
                root)
                            case $hostname in
                                remote) echo "remote" ;;
                                pc) echo "pc" ;;
                                localhost)       echo "mobile" ;;
                            esac; ;;
            esac;
    esac;
    unset -f help;
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
