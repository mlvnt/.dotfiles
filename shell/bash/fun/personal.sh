#   -------------------------------
#   DAV MANAGEMENT
#   -------------------------------

radicalle() {
    radicale_backup () {
        local old=(
            "collections"
            "config"
            "log"
            "rights"
            "ssl"
            "users"
        );

        for i in "${old[@]}"
        do :
            rm -rfv "${remote}"/"$i";
        done

        # delete_cache
        yes yes | sudo cp -rv "${locl}" "${dots}"/config/net;
    }

    radicale_restore() {
        local old=(
            "collections"
            "config"
            "log"
            "rights"
            "ssl"
            "users"
        );

        for i in "${old[@]}"
        do :
            rm -rfv "${locl}"/"$i";
        done

      yes yes | sudo cp -rv "${remote}" "${dots_local}"/.config;
    }

    dav_main() {
        clear;
        python3 -c "exec(\"from scripts import dav_main\ndav_main.main()\")" "$@";
    }

    delete_cache() {
        pushd "${locl}"/collections/collection-root/mlvnt;
        find . -name '.Radicale.cache' -type d -exec rm -rfv {} \;
        popd;
    }

    run() {
        # python3 -m radicale --config ~/.config/radicale/config
        python3 -m radicale --config  "${remote}"/config
    }

    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        radicalle - calDAV / cardDAV management" && echo
        echo "USAGE"
        echo "        radicalle [option]" && echo
        echo "OPTIONS"
        echo "     0 | run                 run radicale server"
        echo "     1 | radicale_backup     backup radicale config"
        echo "     2 | radicale_restore    restore radicale config"
        echo "     3 | delete_cache        delete .Radicale.cache"
        echo "     4 | dav_main            run DAV managemental"
        echo "     5 | local               goto local radicale"
        echo "     6 | remote              goto remote backup"
        echo "     7 | update              update radicale"
        echo "     b                 go back"
        echo "     -h | help         show help" && echo
    }

    if [ -z $1 ] ; then
        help
    else
        input="$1"
        local locl="${dots_local}"/.config/radicale
        local remote="${dots}"/config/net/radicale

        shift 1
        case $input in
            0|run)               run ;;
            1|radicale_backup)   radicale_backup ;;
            2|radicale_restore)  radicale_restore ;;
            3|delete_cache)      delete_cache ;;
            4|davmain)           dav_main "$@"; ;;
            5|local)             cd "${locl}" ;;
            6|remote)            cd "${remote}" ;;
            7|update)            sudo python3 -m pip install --upgrade radicale ;;
            b)  apps 3 ;;
            *)  help ;;
        esac
    fi

    functions=(
        "help"
        "radicale_backup"
        "radicale_restore"
        "dav_main"
        "delete_cache"
        "run"
    )

    variables=(
        "input"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

money() {
    for arg in "$@"; do
        local x=${arg};
        case ${x} in
            -x) local r=True ;;
        esac;
    done;

    clear;

    if [[ -z $r ]]; then
        python3 -c "exec(\"from scripts import money\nmoney.main()\")" "$@";
    else
        xvfb-run --server-args='-screen 0 1280x1024x24' python3 -c "exec(\"from scripts import money\nmoney.main()\")" "$@";
    fi;
}

notebook-backup() {
    pushd ${local}/mobile/notebook
    tree -aF >> structure-$(date "+%Y-%m-%d-%H-%M").txt
    popd
    mv ${local}/mobile/notebook/structure-* /mnt/d/shared/pc/projects/scripts/Bash/notebook-backup
}
