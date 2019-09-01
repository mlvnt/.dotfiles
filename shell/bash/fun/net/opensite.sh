#!/bin/bash

#█▓▒░ set alias ---------------------------------------------------------------#

filename="$( basename ${BASH_SOURCE%.*} )";
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
file="${dir}/${filename}";
als="$( cat ${file}.json | jq .alias | sed 's/"//g' )"

if [ -z "${als}" ]; then
    :
else
    alias "${als}"="${filename}"
fi;

unset -v filename DIR file als

#█▓▒░ begin function ----------------------------------------------------------#

opensite() {
    local filename="${FUNCNAME[0]}";
    local dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )";
    local file="${dir}/${filename}";

#█▓▒░ set debug mode ----------------------------------------------------------#

    local DEBUG=0
    case "$1" in
        debug) local DEBUG=1; shift; ;;
    esac

#█▓▒░ help --------------------------------------------------------------------#

    showHelp() { parse -i "${file}" -p; }
    usage() { parse -i "${file}" -u; }
    version() { parse -i "${file}" -v; }

#█▓▒░ parse arguments ---------------------------------------------------------#

    local OPTIONS=$(parse -i "${file}" -g s);
    local LONGOPTS=$(parse -i "${file}" -g l);
    local PARSED=$(getopt --options=${OPTIONS} --longoptions=${LONGOPTS} --name "$0" -- "$@");
    eval set -- "${PARSED}";

    if [[ "${DEBUG}" == 1 ]]; then
        echo "${debug} ${PARSED}";
    fi;

#█▓▒░ body --------------------------------------------------------------------#

    local browser=c;
    local tab="--new-window";
    local b=0;
    local args="";

    while true; do
        case "$1" in
            -f|--firefox) local browser=f; shift; ;;
            -t|--tab)     local tab=""; shift; ;;
            -h|--help)    local b=1; showHelp; shift; break; ;;
            -v|--version) local b=1; version; shift; break; ;;
            --)
                shift;
                if [[ -z "$@" ]]; then
                    echo -e "${error} no arguments specified\n";
                    showHelp;
                else
                    local args="$(python3 -c "exec(\"import sys\nfrom core import safe_url\nsafe_url(sys.argv[1:])\")" "$@")";
                fi;
                break ;;
            *)  showHelp; break; ;;
                # echo "Programming error"; exit 3;
        esac;
    done;

    if [[ "${DEBUG}" == 1 ]]; then
        echo "${debug} browser: ${browser}, tab: ${tab}, args: ${args}";
    fi;

    if [[ "${b}" == 0 ]] && [[ ! -z "${args}" ]]; then
        local arr=(${args});
        local END=${#arr[@]};

        for ((i=0;i<END;i++)); do
            local count=$(( ${i} + 1 ))
            echo "${green}[opening]${reset} ${bluel}${count}${reset} ${arr[${i}]}";
        done;

        case "${browser}" in
            c) chrome ${tab} --start-maximized ${args}; ;;
            f)  # firefox opens single ulr in a new tab, multiple in a new window
                if [[ -z "${tab}" ]]; then
                    for val in ${args}; do
                        firefox "${val}";
                    done;
                else
                    firefox ${args};
                fi; ;;
        esac;
    else
        :
    fi;

#█▓▒░ unset variables ---------------------------------------------------------#

    functions=(
        "showHelp"
        "usage"
        "version"
    );

    variables=(

    );

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

#█▓▒░ end function ------------------------------------------------------------#
