#   -------------------------------
#   CREATE M3U PLAYLISTS
#   -------------------------------

m3u() {
    # variables
    local dirname="${PWD##*/}";
    local filename="~playlist[ ${dirname} ].m3u";

    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        m3u - create m3u playlist" && echo
        echo "USAGE"
        echo "        m3u [OPTION]" && echo
        echo "OPTIONS"
        echo "    1 | -e | e | ext | extended   -  create extended m3u"
        echo "    -h | help                     -  show help" && echo
    }

    # remove old playlist
    remove_old() {
        local old_new="$(dir -AN1 | grep "~playlist")";
        local old_old="$(dir -AN1 | grep "_tracklist")";

        if [[ ! -z ${old_new} ]]; then
            rm "${old_new}" && echo
            # echo "[remove] $old_new"
        fi

        if [[ ! -z ${old_old} ]]; then
            rm "${old_old}" && echo
            # echo "[remove] $old_old"
        fi
    }

    create_extended() {
        echo ''
        remove_old
        echo -e "#EXTM3U\n" >> "${filename}";

        # read track into array
        local tracks=();
        while IFS=  read -r -d $'\0'; do
            tracks+=("$REPLY")
        done < <(find . -maxdepth 1 -type f -regextype posix-extended -not -type d -not -regex "(.*.(m3u|txt|jpg|png|html|url|pdf|log|nfo))" -print0)

        # create playlist
        for track in "${tracks[@]}"; do
            local t=$(echo "${track}" | sed 's/\.\///g');
            local duration=$(ffprobe "${t}" 2>&1 | grep 'Duration:' | tr ' ' '\n' | tail -n6 | head -n1 | sed 's/,//g ; s/://g ; s/\.[0-9]*//g ; s/^0*//g');
            local title=$(ffprobe "${t}" 2>&1 | grep 'TITLE' | tr ':' '\n' | tail -n1 | sed 's/^ //g');
            local artist=$(ffprobe "${t}" 2>&1 | grep 'ARTIST' | tr ':' '\n' | tail -n1 | sed 's/^ //g');
            echo "#EXTINF:${duration}, ${artist} - ${title}" >> "${filename}";
            echo "${t}" >> "${filename}";
            echo >> "${filename}";
        done
        echo "[created] ${filename}" && echo
        o "${filename}"
    }

    create_simple() {
        echo ''
        remove_old
        find . -maxdepth 1 -type f -regextype posix-extended -not -type d -not -regex "(.*.(m3u|txt|jpg|png|html|url|pdf|log|nfo))" -printf "%P\n" >> "${filename}"
        echo "[created] ${filename}" && echo
        o "${filename}"
    }

    if [[ -z $1 ]]; then
        create_simple
    fi

    case $1 in
        1|-e|e|ext|extended) create_extended ;;
        -h|help)             help ;;
    esac

    functions=(
        "help"
        "create_simple"
        "create_extended"
        "remove_old"
    )

    unset -f "${functions[@]}";
    unset -v functions;
}
