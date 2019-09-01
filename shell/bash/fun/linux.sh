man2pdf() {
    usage() {
       echo "usage:- man2pdf [manpage]";
    }

    create_pdf() {
       man -t $manpage > /tmp/${manpage}.ps && ps2pdf /tmp/${manpage}.ps
       rm -f /tmp/${manpage}.ps
       openfile "${manpage}.pdf"
    }

    manpage=$1

    if [ -z "$manpage" ]; then
       usage
    else
        if [ -f ${manpage}.pdf ]; then
           read -p "${manpage}.pdf file exists, do you want to replace it?:" ans_yn
           case "$ans_yn" in
              [Yy]|[Yy][Ee][Ss]) echo "Replacing ${manpage}.pdf ...";;
           esac
        fi
        create_pdf
    fi
}

x() {
    help() {
        clear
        echo -e '\n  Available Options:'
        echo    '       x  | Exit'
        echo -e '       b  | Go Back\n'
        echo    '       1  | Launch xfce4 session'
        echo    '       2  | Launch i3-wm session'
        echo    '       3  | Load xserver in multi window mode'
        echo    '       4  | Load xserver in windowed mode'
        echo -e '       5  | Create new xserver config\n'
        read -e -p "  Enter Option: " input
        echo
    }

    local path2="$(wslpath -w $HOME/.dotfiles/wsl/x11/vcxsrv)\\"
    local path="C:\Program Files\VcXsrv"
    # local win32="C:\Windows\System32"

    if [ -z ${input2} ]; then
        help
    else
        local input=${input2}
    fi

    case ${input} in
        1)
            echo -e "\n Launching xfce4....\n----------------------------------"
            cmds "${path}" "${path2}"configWindowed.xlaunch
            xfce4-session &>/dev/null & ;;
            # cmds "$win32" bash.exe --login -c "sudo xfce4-session"
            # sudo chown -v $USER ~/.ICEauthority
        2)
            echo -e "\n Launching i3-wm....\n----------------------------------"
            cmds "${path}" "${path2}"configWindowed.xlaunch
            i3 &>/dev/null & ;;
            # cmds "$win32" bash.exe --login -c "sudo i3"
        3)
            echo -e "\n Loading X Server in Multi Window mode....\n"
            cmds "${path}" "${path2}"configMultiWindow.xlaunch ;;
        4)
            echo -e "\n Loading X Server in Windowed mode....\n"
            cmds "${path}" "${path2}"configWindowed.xlaunch ;;
        5)  cmds "${path}" xlaunch.exe && clear  ;;
        b)  linx ;;
        x)  : && clear ;;
        *)  x ;;
    esac;
}
