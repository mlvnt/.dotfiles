#   -------------------------------
#   CLASH OF CLANS BOT
#   -------------------------------

coc() {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        coc - Clash of Clans Management" && echo
        echo "USAGE"
        echo "        coc [OPTION]" && echo
        echo "OPTIONS"
        echo "    -u  | u  | update    -  update local files"
        echo "    -ug | ug | upgrade   -  upgrade bot version"
        echo "    -h  | help           -  show help" && echo
    }

    coc_run() {
        pushd "${winhl}/Downloads";
        local name=$(dir -AN1 | grep MyBot);
        local path="${winhw}\Downloads\\${name}";
        # local path="${winhw}\Downloads\\${name}\MyBot.run.exe";
        # timeout 6s cmd.exe /c ${path} MyVillage MEmu MEmu;
        cmds "${path}" MyBot.run.exe MyVillage MEmu MEmu;
        echo -e '\n [opening] mybotrun - Clash of Clans Bot\n';
        popd
    }

    coc_update() {
        rm -rfv $winhl/Downloads/MyBot-MBR_v*;
        local path="$local/pc/apps/net/mybotrun/MyBot-MBR_v*";
        local des="$winhl/Downloads";
        local base=$(basename $path);
        local source=$(wslpath -w "$path");
        local dest=$(wslpath -w "$des/$base");
        cmdc robocopy $source $dest /E /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1;
        # cp -rfv $path $dest
    }

    coc_upgrade() {
        # cd "$local/pc/apps/mybotrun"
        local old=$(dir -AN1 | grep -v '.zip' | grep MyBot); # exclude zips
        local new=$(dir -AN1 | grep MyBot-MBR_v*.zip);
        local unziped=$(echo "$new" | sed 's/.zip//g');
        # unzip "$new"
        7z.exe x "$new";
        cp -rv "$old/Profiles" "$unziped";
        cp -v "$old/CSV/Attack/TH 10 2Hound26Loon10Wb15Min11Haste.csv" "$unziped/CSV/Attack";
        rm -rfv "$old";
        mv -v "$new" "/mnt/d/~temp";
    }

    if [[ -z $1 ]]; then
        coc_run;
    fi;

    case $1 in
        -u|u|update)     coc_update ;;
        -ug|ug|upgrade)  coc_upgrade ;;
        -h|help)         help ;;
    esac;

    functions=(
        "help"
        "coc_run"
        "coc_update"
        "coc_upgrade"
    )

    unset -f "${functions[@]}";
    unset -v functions;
}

stclean() {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        stclean - clean syncthing file versions" && echo
        echo "USAGE"
        echo "        stclean [OPTION]" && echo
        echo "OPTIONS"
        echo "        p   pc"
        echo "        p   moblie"
        echo "        e   ereader"
        echo "        a   all" && echo
    }

    local dirs=(
        "${local}/pc/.stversions"
        "${local}/mobile/.stversions"
        "${local}/ereader/.stversions"
        "${local}/work/.stversions"
    );

    case "$1" in
        p) rm -rfv "${dirs[0]}"/* && clear; ;;
        m) rm -rfv "${dirs[1]}"/* && clear; ;;
        e) rm -rfv "${dirs[2]}"/* && clear; ;;
        a)  for d in "${dirs[@]}"; do
                rm -rfv "${d}"/* && clear;
            done; ;;
        *) help ;;
    esac;

    unset help;
}

qrcode() {
    cmds "$(wslpath -w ${local})\pc\apps\file management\conversion\qrcodegen" QRCodeGen.jar;
    # cat /mnt/d/~temp/test.txt | qrencode -o address.png -s 10 -l L -d 100
}

ahk() {
    local p="$(wslpath -w $(pwd))";
    cmds "$(wslpath -w ${local})\pc\apps\suites\symenu\ProgramFiles\SPSSuite\SyMenuSuite\AutoHotkey_Compiler_sps" AutoHotkeyU64.exe "$p"/"$1";
}

#   -------------------------------
#   OPEN MULTIPLE WORD DOCUMETS
#   -------------------------------

word() {
    re='^[0-9]+$'
    path="$(wslpath -w $local)\pc\docs\templates\microsoft office\landscape.dotm"

    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        word - open Microsoft Word documents" && echo
        echo "SYNTAX"
        echo "        word [OPTION] [FILE NUMBER]"
        echo "        word [FILE NUMBER] [OPTION]" && echo
        echo "OPTIONS"
        echo "        l   Landscape orientation" && echo
    }

    wordo() {
        clear && echo
        for (( i=1; i<=$input; i++ )); do
           # echo "   Opening word document $i...."
           if [[ $orientation == l ]] ; then
               cmds 'C:\Program Files\Microsoft Office\Office16' WINWORD.EXE /t"$path"
               sleep 0.2s
            else
               cmds 'C:\Program Files\Microsoft Office\Office16' WINWORD.EXE /w
               sleep 0.2s
            fi;
        done;
        clear
    }

    if [[ $1 =~ $re ]] && [[ -z $2 ]] ; then
        input=$1
        orientation=""
        wordo
    elif [[ $1 =~ $re ]] && [[ $2 == l ]] ; then
        input=$1
        orientation=$2
        wordo
    elif [[ $1 == l  ]] && [[ $2 =~ $re ]] ; then
        input=$2
        orientation=$1
        wordo
    else
        help
    fi

    functions=(
        "help"
        "wordo"
    )

    variables=(
        "re"
        "path"
        "input"
        "orientation"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}

enpass_setup(){
    pushd ${winhl}/AppData/Local;
    links 3 -d -m r -r '4';
    popd
    pushd ${winhl}/AppData/Roaming;
    links 3 -d -m r -r '5';
    popd
}

vscodeclean() {
    help() {
        clear && echo && echo "DESCRIPTION";
        echo "        vscodeclean - clean vscode cache" && echo;
        echo "USAGE";
        echo "        vscodeclean [OPTION]" && echo;
        echo "OPTIONS";
        echo "        local     clean local installation";
        echo "        e         remove old extention updates" && echo;
    }

    if [[ $(currentdevice) == pc ]]; then
        local home="home";
    else
        local home="shared";
    fi;

    local path="${local}/pc/config/development/editors/vscode/${home}"
    local dirs=(
        "Backups"
        "Cache"
        "CachedData"
        "CachedExtensions"
        "GPUCache"
        "logs"
        "User/workspaceStorage"
    );

    local files=(
        "Cookies"
        "Cookies-journal"
        "languagepacks.json"
        "Preferences"
        "storage.json"
    );

    case $1 in
        local)
            for f in "${files[@]}"; do
                rm ${path}/user-data/${f};
            done;
            for d in "${dirs[@]}"; do
                rm -rfv ${path}/user-data/${d}/*;
            done;
            rm -rfv ${path}/tmp/*; ;;
        ""|e)
            pushd "${local}/pc/apps/development/editors/editors/vscode/data/extensions"
            python3 -c "exec(\"from scripts import vscode\nvscode.delete_dublicate()\")";
            popd ;;
        *) help ;;
    esac;

    unset help;
}

vscode_setup(){
    pushd ${winhl};
    links 3 -d -m r -r '0:2' -v;
    popd
    pushd ${local}/pc/apps/development/editors/editors/vscode/data;
    links 3 -d -m r -r '2:4' -v;
    popd
}
