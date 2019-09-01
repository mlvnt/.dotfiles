testsh() {
    help() {
        clear && echo && echo "DESCRIPTION"
        echo "        testsh - shell script testing" && echo
        echo "USAGE"
        echo "        testsh [OPTION]" && echo
        echo "OPTIONS"
        echo "    run               run the test script"
        echo "    del | delete      delete the test script"
        echo "    -h  | help        show help" && echo
    }

    local file=~/test.sh;
    edit() { nano "${file}"; }
    run() { . "${file}"; }
    del() { rm "${file}"; }

    if [[ -z $1 ]]; then
        edit;
        if [[ ! -x ${file} ]]; then
            chmod +x "${file}";
        fi;
    fi;

    case $1 in
        run)      run ;;
        del|delete)   del ;;
        -h|help)  help ;;
    esac;

    functions=(
        "help"
        "edit"
        "run"
        "del"
    )

    unset -f "${functions[@]}";
    unset -v functions;
}

pyclean() {
    find . -regextype posix-extended -regex '.*(__pycache__|\.pytest_cache|build|dist|\.egg-info)' -print0 | xargs -0 rm -rv 2>/dev/null || : ;
    find . -regextype posix-extended -regex '.*\.py[co]' | grep -v '__pycache__' | tr -d '\n' | xargs -0 rm -rv 2>/dev/null || : ;
 }


