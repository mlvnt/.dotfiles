sortkml() {
    pushd ${local}/mobile/config/travel/maps.me;
    clear;
    python3 -c "exec(\"from scripts import sortkml\nsortkml.main()\")" "$@";
    popd
}

apkinstall() {
    pushd ${local}/mobile/apps;
    clear;

    local count="$(find . -name 'log-*.txt' | wc -l | tr -d '\n')";
    local limit=5;

    if (( count >= limit )); then
        rm -v $(find . -name 'log*.txt' | head -1);
    fi;

    python3 -c "exec(\"from scripts import apkinstall\napkinstall.main()\")" "$@" | tee -ai log-$(date "+%Y-%m-%d-%H-%M").txt;
    # python3 $path/apkinstall.py "$@" | tee $(tty) | \
    #                                   tee -ai log-$(date "+%Y-%m-%d-%H-%M").txt;
    popd
}
