#!/bin/bash
# ┏━┓┏━┓┳  ┏━┓┳━┓┓━┓
# ┃  ┃ ┃┃  ┃ ┃┃┳┛┗━┓
# ┗━┛┛━┛┇━┛┛━┛┇┗┛━━┛

terminal_colors() {
    #█▓▒░ color scheme
    # black 1,9
    local c01="0";
    local c01l="0";

    # red 2,10
    local c02="1";
    local c02l="1";

    # green 3,11
    local c03="2";
    local c03l="2";

    # yellow 4,12
    local c04="3";
    local c04l="3";

    # blue 5,13
    local c05="4";
    local c05l="4";

    # magenta 6,14
    local c06="5";
    local c06l="5";

    # cyan 7,15
    local c07="6";
    local c07l="6";

    # white 8,16
    local c08="7";
    local c08l="7";

    #█▓▒░ handle prompts
    local BASH_PS1="${1:-false}";
    if [[ ${BASH_PS1} == true ]]; then
        local open="\[";
        local close="\]";
    else
        local open="";
        local close="";
    fi;
    local esc=$(printf '\033');

    #█▓▒░ which specification to use
    specification() {
        case "$1" in
            4)
                fg="";
                bg="";
                ;;
            8)
                fg="38;2;";
                bg="48;2;";
                ;;
            24)
                fg="38;5;";
                bg="48;5;";
                ;;
        esac;
    }

    #█▓▒░ generate single color
    color_gen(){
        if [[ -z "$2" ]]; then
            local mode="";
            local intensity="";
            local color="${1}";
        elif [[ -z "$3" ]]; then
            local mode="${1}";
            local intensity="";
            local color="${2}";
        else
            local mode="${1}";
            local intensity="${2}";
            local color="${3}";
        fi;
        printf "${open}${esc}[${mode}${intensity}${color}m${close}";
    }

    #█▓▒░ generate the palette
    palette_gen() {
        local spec=4
        specification ${spec}
        case "$1" in
            fg)
                local mode="${fg}";
                local level="";
                if [[ "${spec}" == 4 ]]; then
                    local i="3";
                    local il="9";
                else
                    local i="";
                    local il="";
                fi;
                ;;
            bg)
                local mode="${bg}";
                local level="_bg";
                if [[ "${spec}" = 4 ]]; then
                    local i="4";
                    local il="10";
                else
                    local i="";
                    local il="";
                fi;
                ;;
        esac;

        declare -g black${level}="$(color_gen ${mode} ${i} ${c01})";
        declare -g blackl${level}="$(color_gen ${mode} ${il} ${c01l})";
        declare -g red${level}="$(color_gen ${mode} ${i} ${c02})";
        declare -g redl${level}="$(color_gen ${mode} ${il} ${c02l})";
        declare -g green${level}="$(color_gen ${mode} ${i} ${c03})";
        declare -g greenl${level}="$(color_gen ${mode} ${il} ${c03l})";
        declare -g yellow${level}="$(color_gen ${mode} ${i} ${c04})";
        declare -g yellowl${level}="$(color_gen ${mode} ${il} ${c04l})";
        declare -g blue${level}="$(color_gen ${mode} ${i} ${c05})";
        declare -g bluel${level}="$(color_gen ${mode} ${il} ${c05l})";
        declare -g magenta${level}="$(color_gen ${mode} ${i} ${c06})";
        declare -g magental${level}="$(color_gen ${mode} ${il} ${c06l})";
        declare -g cyan${level}="$(color_gen ${mode} ${i} ${c07})";
        declare -g cyanl${level}="$(color_gen ${mode} ${il} ${c07l})";
        declare -g white${level}="$(color_gen ${mode} ${i} ${c08})";
        declare -g whitel${level}="$(color_gen ${mode} ${il} ${c08l})";
    }

    #█▓▒░ formatting
    reset="${open}${esc}[0m${close}";
    reset_fg="${open}${esc}[39m${close}";
    reset_bg="${open}${esc}[49m${close}";
    bold="${open}${esc}[1m${close}";
    faint="${open}${esc}[2m${close}";
    standout="${open}${esc}[3m${close}";
    underlined="${open}${esc}[4m${close}";
    blink="${open}${esc}[5m${close}";
    reverse="${open}${esc}[7m${close}";
    hidden="${open}${esc}[8m${close}";

    #█▓▒░ foreground color
    palette_gen "fg";

    #█▓▒░ background color
    palette_gen "bg";

    #█▓▒░ special
    background="${black}";
    foreground="${whitel}";
    cursor="${whitel}";

    #█▓▒░ logging
    nfo="${green}[info]${reset}";
    error="${red}[error]${reset}";
    warn="${yellow}[warn]${reset}";
    debug="${cyan}[debug]${reset}";

    unset -f specification color_gen palette_gen;
    unset -v bg fg;
}
