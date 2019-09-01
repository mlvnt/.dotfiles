#   -------------------------------
#   MANAGE MY BLOG
#   -------------------------------

blog() {
    local gamespath="${local}/pc/projects/blog/bgrebbels.mlvnt.com/build";
    local blogpath="${local}/pc/projects/blog/mlvnt.com";
    local content="${local}/pc/projects/blog/mlvnt.com/content";
    local contents="$(wslpath -w ${local})\pc\projects\blog\mlvnt.com\content";
    local buildpath="${local}/pc/projects/blog/mlvnt.com/build";
    local filezilladir="${aps}\suites\portableapps.com\PortableApps\FileZillaPortable";
    local ext=".md";

    help() {
        clear
        echo -e '\n  Available Options:'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '       My Blog:'
        echo    '           1  | goto   | Go to'
        echo    '           2  | run    | Run'
        echo    '           3  | server | Run on Web Server'
        echo    '           4  | build  | Clean build'
        echo    '           5  | new    | New Post'
        echo    '       Game Site:'
        echo    '           6  | Go to'
        echo    '           7  | Run'
        echo    '       Manage:'
        echo    '           8  | Rsync'
        echo -e '           9  | SFTP\n'
        read -e -p "  Enter Option: " input
        echo
    }

    if [ -z $1 ] ; then
        help;
    else
        local input=$1;
    fi

    tpe() {
        help() {
            clear && echo
            echo -e '\n  available types:'
            echo    '       1  |  code'
            echo    '       2  |  default'
            echo    '       3  |  interests'
            echo    '       4  |  projects'
            echo    '       5  |  tech'
            echo -e '       6  |  wechat\n'
        }

        read -e -p "  type? " type
        case $type in
            1|code)
                local t="code";
                local path="blog/tech/code/"; ;;
            2|default)
                local t="default"
                local path="blog/"; ;;
            3|interests)
                local t="interests"
                local path="blog/interests/"; ;;
            4|projects)
                local t="projects";
                local path="projects/"; ;;
            5|tech)
                local t="tech";
                local path="blog/tech/2018/"; ;;
            6|wechat)
                local t="wechat";
                local path="blog/wechat"; ;;
            *)  help && tpe ;;
        esac
    }

    case $input in
        1|goto)  cd "$blogpath"; ;;
        2|run)   cd "$blogpath" && chrome "http://localhost:1313";
                 hugos; ;;
        3|server)  pushd "$blogpath" && npm run build && popd;
                   pushd "$buildpath" && chrome "http://localhost:2015";
                   caddy && popd; ;;
        4|build)  pushd "$blogpath" && npm run build && popd; ;;
        5|new)  clear && echo;
                tpe;
                clear && echo "$t";
                echo && tree "$content/$path" && echo;
                read -e -p "  post name? " post;
                pushd "$blogpath" && echo && hugo new $path/$post$ext -k $t && echo;
                vscode "$contents/$path/$post$ext" && popd; ;;
        6)  cd "$gamespath"; ;;
        7)  pushd "$gamespath";
            chrome "http://localhost:2015";
            caddy;
            popd; ;;
        8)  # rsync -a ~/testfile todorov@mlvnt.com:~/
            ;;
        9)  cmds "$filezilladir" FileZillaPortable.exe; ;;
            # sftp -b ~/.dotfiles/wsl/net/sftpbatch todorovfiles@mlvnt.com
            # sftp todorovfiles@mlvnt.com:uploads/
        b)  mywork; ;;
        x)  : && clear; ;;
        *)  blog; ;;
    esac

    functions=(
        "help"
        "tpe"
    );

    variables=(
        "input"
    );

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}
