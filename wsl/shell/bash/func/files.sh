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
