openwin() {
    if [[ ! -z $1 ]]; then
        target="$(wslpath -w "$1")"
        cmd.exe /c explorer.exe "$target"
    fi
}

winalias() {
    #This will turn every executable inside of system32 into a bash alias so that it can be
    #executed easily.. such as ipconfig, tasklist, taskkill, etc
    #there is no error checking.. its pretty basic/simple

    echo "scanning win32 and creating aliases..."
    unset -f cd
    # remove all sourced aliases
    unalias -a
    rm -fv ~/.bash_aliases_win ~/.windows.exe
    cd /mnt/c/Windows/System32
    ls *.exe > ~/.windows.exe
    for i in $(cat ~/.windows.exe); do
        a=$(echo $i | cut -d. -f1);
        b=$(echo $a | awk '{print tolower($0)}');
        alias $b="$a.exe";
    done
    cd ~
    echo -e '#!/bin/bash\n' > ~/.bash_aliases_win
    alias >> ~/.bash_aliases_win
    unalias -a
    source ~/.bash_aliases ~/.bash_aliases_win ~/.bash_functions
    rm -f ~/.windows.exe
    # echo "export PATH=\"\$PATH:/mnt/c/Windows/System32\"" >> ~/.bashrc
    # echo "source ~/.bash_aliases_win" >> ~/.bashrc
    # source ~/.bashrc
    # echo "restart bash to use.. or type source ~/.bashrc"
    unset -v a b
}
