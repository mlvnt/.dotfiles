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

currentdevice() {
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

    local args="";

    while true; do
        case "$1" in
            -h|--help)    local b=1; showHelp; shift; break; ;;
            -v|--version) local b=1; version; shift; break; ;;
            --)
                shift;
                if [[ -z "$@" ]]; then
                    echo -e "${error} no arguments specified\n";
                    showHelp;
                else
                    local args="$@";
                fi;
                break ;;
            *)  showHelp; break; ;;
        esac;
    done;

    if [[ "${DEBUG}" == 1 ]]; then
        echo "${debug} args: ${args}";
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
