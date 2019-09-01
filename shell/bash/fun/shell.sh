unsetall() {
    help() {
        echo && echo "DESCRIPTION"
        echo "        unsetall - unset all functions or variables defined in bash" && echo
        echo "USAGE"
        echo "        unsetall [OPTION]" && echo
        echo "OPTIONS"
        echo "     -f                functions"
        echo "     -e                environmental (exported) variables"
        echo "     -v                shell variables"
        echo "     -a                aliases"
        echo "     -h | help         show help" && echo
    }

    unsetenv() { unset $(env | awk -F"=" '{print $1}' | grep -v '^_'); }

    unsetfun() { unset $(declare -F | awk -F" -f " '{print $2}' | grep -v '^_'); }

    unsetvar() {
        local ignores="BASH\nBASH_COMMAND\nBASH_SUBSHELL\nBASH_VERSION\nCOLUMNS\nCOMP_WORDBREAKS\nHOSTNAME\nIFS\nLINES\nMACHTYPE\nOPTERR\nOSTYPE\nPS1\nPS2\nPS4\nSECONDS\nblack\nblue\ngreen\nred\n";
        unset $(comm -3 <(declare -p | grep "declare -- " | awk -F" -- " '{print $2}' | grep -v '^_' | awk -F"=" '{print $1}' | sort) <(printf "${ignores}" | sort));
    }

    case $1 in
        -e) unsetenv ;;
        -f) unsetfun ;;
        -v) unsetvar ;;
        -a) unalias -a ;;
        *)  help ;;
    esac
    unset -f help unsetenv unsetfun unsetvar;
}

listall() {
    help() {
        echo && echo "DESCRIPTION"
        echo "        listall - list all functions or variables defined in bash" && echo
        echo "USAGE"
        echo "        listall [OPTION]" && echo
        echo "OPTIONS"
        echo "     -f                functions"
        echo "     -e                environmental (exported) variables"
        echo "     -v                shell variables"
        echo "     -va               all variables"
        echo "     -a                aliases"
        echo "     -h | help         show help" && echo
    }

    case $1 in
        -e)  env | sort; ;;
        -f)  declare -F; ;;
        -v)  declare -p | grep "declare -- " | sort; ;;
        -va) declare -p | sort; ;;
        -a)  alias; ;;
        *)   help; ;;
    esac
    unset -f help;
}

# `shellswitch [bash |zsh]`
#   Must be in /etc/shells
shellswitch() { chsh -s /usr/bin/$1; }

reverse() {
    if [ "$#" -gt 0 ]; then
        local arg=$1
        shift
        reverse "$@"
        printf '%s\n' "$arg"
    fi
}

is_root() { [ $(id -u) -eq 0 ] && return $TRUE || return $FALSE; }
