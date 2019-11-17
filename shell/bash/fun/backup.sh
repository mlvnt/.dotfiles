#█▓▒░ move, copy ---------------------------------------------------------------

backup() { echo "test"; }

move() {

    # dotfilesdird="/mnt/d/sync/pc/projects/dotfiles/dotfiles"
    # dotfilesdire="/mnt/e/backup/shared/pc/projects/dotfiles/dotfiles"
    # animemain="/mnt/e/backup/media/anime/seasonal/~main/"

    #         case $input in
    #             1|3) robonorm="/E" && rsyncnorm='' ;;
    #             2|4) robonorm="/E /PURGE" && rsyncnorm="--delete " ;;
    #         esac

    #         case $input in
    #             1|2) robocopyoptions=""$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
    #                  ryncoptions="-avhzH --progress --stats "$rsyncnorm"" ;;
    #             3|4) robocopyoptions="/L "$robonorm" /ZB /SL /MT:20 /XO /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
    #                  ryncoptions="-avhzH --progress --stats --dry-run "$rsyncnorm"" ;;
    #         esac


    #         case $input in
    #             1|2) robocopyoptions=""$robonorm" /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
    #                  ryncoptions="-avhzH --progress --stats --ignore-times "$rsyncnorm"" ;;
    #             3|4) robocopyoptions="/L "$robonorm" /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
    #                  ryncoptions="-avhzH --progress --stats --ignore-times --dry-run "$rsyncnorm"" ;;
    #         esac

    # case $input in
    #     1)  main_backup

    #         excludeddir="/mnt/d/sync/pc/projects/dotfiles/dotfiles/wsl/files/rsync/excluded"
    #         drived="/mnt/d/"
    #         bakcupdire="/mnt/e/backup"
    #         logdir="/mnt/e/backup_logs/"
    #         logfile="log_backup-$(date "+%Y-%m-%d-%H-%M").txt"
    #         workspacedird="D:\workspace"
    #         workspacedire="E:\backup\workspace"
    #         link_dir_1="/mnt/e/backup/workspace"
    #         link_dir_2="/mnt/e/backup/workspace/shared"
    #         ;;
    #     2)  mobile_backup

    #         excludeddir="/mnt/d/sync/pc/projects/dotfiles/dotfiles/wsl/files/rsync/excluded_mobile"
    #         sdcard=""
    #         bakcupdire="/mnt/e/backup_mobile/"
    #         logdir="/mnt/e/backup_logs/"
    #         logfile="log_backup-$(date "+%Y-%m-%d-%H-%M").txt"

    #         if [ $input -eq 1 ] || [ $input -eq 3 ] ; then
    #             rsyncnorm=''
    #         elif [ $input -eq 2 ] || [ $input -eq 4 ] ; then
    #             rsyncnorm="--delete "
    #         fi

    #         if [ $input -eq 3 ] || [ $input -eq 4 ] ; then
    #             ryncoptions="-avhzH --progress --stats --dry-run "$rsyncnorm""
    #         elif [ $input -eq 1 ] || [ $input -eq 2 ] ; then
    #             ryncoptions="-avhzH --progress --stats "$rsyncnorm""
    #         fi
    #         ;;
    #     3)  main_restore

    #         drived="/mnt/d"
    #         bakcupdire="/mnt/e/backup/"
    #         logdir="/mnt/e/restore_logs/"
    #         logfile="log_restore-$(date "+%Y-%m-%d-%H-%M").txt"
    #         workspacedird="D:\workspace"
    #         workspacedire="E:\backup\workspace"
    #         link_dir_1="/mnt/d/workspace"
    #         link_dir_2="/mnt/d/sync"
    #         ;;
    #     4)  mobile_restore

    #         drived="/mnt/d"
    #         bakcupdire="/mnt/e/backup/"
    #         logdir="/mnt/e/restore_logs/"
    #         logfile="log_restore-$(date "+%Y-%m-%d-%H-%M").txt"
    #         workspacedird="D:\workspace"
    #         workspacedire="E:\backup\workspace"
    #         link_dir_1="/mnt/d/workspace"
    #         link_dir_2="/mnt/d/sync"

    #         case $input in
    #             1|3) robonorm="/E" && rsyncnorm='' ;;
    #             2|4) robonorm="/E /PURGE" && rsyncnorm="--delete " ;;
    #         esac

    #         case $input in
    #             1|2) ryncoptions="-avhzH --progress --stats --ignore-times "$rsyncnorm"" ;;
    #             3|4) ryncoptions="-avhzH --progress --stats --ignore-times --dry-run "$rsyncnorm"" ;;
    #         esac
    #         ;;
    #     5)  main_clone

    #             echo
    #             read -e -p "  Enter Drive Letter/Path [c]:" backdir
    #             dotfilesdird="/mnt/d/sync/pc/projects/dotfiles/dotfiles/"
    #             dotfilesdire="/mnt/"$backdir"/workspace/tech/programing/dotfiles/dotfiles"
    #             drived="/mnt/d/"
    #             drivedwin="D:\\"

    #             robocopyoptions="/E /ZB /SL /MT:20 /A-:HS /COPY:DAT /DCOPY:DAT /W:0 /R:1 /ETA"
    #             ryncoptions="-avhzH --progress --stats"
    #             ;;
    #     6)  mobile_clone

    #             echo
    #             read -e -p "  Enter Drive Letter/Path [c]:" backdir
    #             dotfilesdird="/mnt/d/sync/pc/projects/dotfiles/dotfiles/"
    #             dotfilesdire="/mnt/"$backdir"/workspace/tech/programing/git/dotfiles"
    #             drived="/mnt/e/backup_mobile/"
    #             drivedwin="E:\\backup_mobile"
    #             ryncoptions="-avhzH --progress --stats"
    #             ;;
    #     7)  move_all
    #             downloads="$winhl/Downloads/"
    #             documents="$winhl/Documents/"
    #             temp="/mnt/d/~temp"
    #             ;;
    #     8)  move_screenshots

    #             temp="/mnt/d/~temp"
    #             screenshotsdir="${winhl}/Pictures/My Screen Shots/"
    #             animepicsdir="/mnt/d/workspace/essential/media/pictures/art/screenshots"
    #             animepicsdirwin="D:\workspace\essential\media\pictures\art\screenshots"
    #             acerscreendir="/mnt/d/workspace/tech/devices/laptops/Acer Predator G9-792/screenshots"
    #             surfscreendir="/mnt/d/workspace/tech/devices/laptops/Microsoft Surface Pro 4/screenshots"
    #             ;;
    # esac

    main_backup() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo    '           1  | Normal'
            echo    '           2  | Mirroring'
            echo    '           3  | Dry-Run Normal'
            echo -e '           4  | Dry-Run Mirroring\n'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    backups() {
                        mkdir -p "$animemain"
                        #-------------------------------------------------------
                        sudo rsync $ryncoptions --exclude-from="$excludeddir" "$drived" "$bakcupdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        sudo rsync $ryncoptions "${dotfilesdird}/" "$dotfilesdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        #-------------------------------------------------------
                        case $input in
                            1|2) find "$link_dir_1" "$link_dir_2" -type l -print0 | xargs -0 rm -v -- ;;
                            3|4) find "$link_dir_1" "$link_dir_2" -type l ;;
                        esac
                        cmd.exe /c robocopy "$workspacedird" "$workspacedire" "*" $robocopyoptions
                        # CHCP 1251
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)
                    move ;;
            x)
                    : && clear ;;
            *)
                    main ;;
        esac
    }

    main_clone() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo -e '           1  | Proceed\n'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1)

                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Main Drive.... ~~~~~~~~~~~~~~\n'
                    clone() {
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        mkdir -p "/mnt/"$backdir"/workspace/Projects/Programing/dotfiles/dotfiles/"
                        sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        cmd.exe /c robocopy "$drivedwin" "$backdir:\\" "*" $robocopyoptions
                    }
                    clone
                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Complete! ~~~~~~~~~~~~~~\n'
                    ;;
            b)      move ;;
            x)      : && clear ;;
            *)      main ;;
        esac
    }

    main_restore() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo    '           1  | Normal'
            echo    '           2  | Mirroring'
            echo    '           3  | Dry-Run Normal'
            echo -e '           4  | Dry-Run Mirroring\n'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    backups() {
                        sudo rsync $ryncoptions "${dotfilesdire}/" "$dotfilesdird"
                        echo -e "\n     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"
                        case $input in
                            1|2) find "$link_dir_1" "$link_dir_2" -type l -print0 | xargs -0 rm -v -- ;;
                            3|4) find "$link_dir_1" "$link_dir_2" -type l ;;
                        esac
                        cmd.exe /c robocopy "$workspacedire" "$workspacedird" "*" $robocopyoptions
                        # CHCP 1251
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)      move ;;
            x)      : && clear ;;
            *)      main ;;
        esac
    }

    mobile_backup() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo    '           1  | Normal'
            echo    '           2  | Mirroring'
            echo    '           3  | Dry-Run Normal'
            echo -e '           4  | Dry-Run Mirroring\n'
            read -e -p "  Option: " input
        }
        help

        if [ $input -eq 1 ] || [ $input -eq 2 ] || [ $input -eq 3 ] || [ $input -eq 4 ]; then
            echo -e '\n ~~~~~~~~~~~~~~ Backup Mobile SD Card.... ~~~~~~~~~~~~~~\n'
            mkdir -p "$logdir" && sudo touch "$logdir$logfile"

            backups() {
                sudo rsync $ryncoptions --exclude-from="$excludeddir" "$sdcard" "$bakcupdire"
            }

            backups | sudo tee -ai "$logdir$logfile"
            echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n'
        elif [ $input == b ] ; then
            move
        elif [ $input == x ] ; then
            : && clear
        else
            mobile
        fi
    }

    mobile_clone() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo -e '           1  | Proceed\n'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1)
                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Main Drive.... ~~~~~~~~~~~~~~\n'
                    clone() {
                        sudo rsync $ryncoptions "$dotfilesdird" "$dotfilesdire"
                    }
                    clone
                    echo -e '\n ~~~~~~~~~~~~~~ Cloning Complete! ~~~~~~~~~~~~~~\n'
                    ;;
            b)      move ;;
            x)      : && clear ;;
            *)      main ;;
        esac
    }

    mobile_restore() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo    '           1  | Normal'
            echo    '           2  | Mirroring'
            echo    '           3  | Dry-Run Normal'
            echo -e '           4  | Dry-Run Mirroring\n'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1|2|3|4)
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Main Drive.... ~~~~~~~~~~~~~~\n'
                    mkdir -p "$logdir" && sudo touch "$logdir$logfile"

                    backups() {
                        sudo rsync $ryncoptions "$dotfilesdire" "$dotfilesdird"
                    }

                    backups | sudo tee -ai "$logdir$logfile"
                    echo -e '\n ~~~~~~~~~~~~~~ Backup Complete! ~~~~~~~~~~~~~~\n' ;;
            b)      move ;;
            x)      : && clear ;;
            *)      main ;;
        esac
    }

    move_screenshots() {
        help() {
            clear
            echo -e '\n  Available Options:\n'
            echo    '           x  | Exit'
            echo    '           b  | Go Back'
            echo    '           1  | Anime Pics'
            echo    '           2  | Acer Screenshots'
            echo -e '           3  | Surface Screenshots'
            read -e -p "  Option: " input
        }
        help

        case $input in
            1)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Anime Pics.... ~~~~~~~~~~~~~~\n'
                rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\[0-9\]*.PNG --exclude=\* "$screenshotsdir" "$animepicsdir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
                o "$animepicsdirwin" ;;
            2)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Acer Screenshots.... ~~~~~~~~~~~~~~\n'
                    rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$acerscreendir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n' ;;
            3)
                echo -e '\n ~~~~~~~~~~~~~~ Moving to Surface Screenshots.... ~~~~~~~~~~~~~~\n'
                rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\Screen\ Shot*.PNG --exclude=\* "$screenshotsdir" "$surfscreendir"
                echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n' ;;
            b)  move ;;
            x)  : && clear ;;
            *)  move_screenshots ;;
        esac
    }

    move_all() {
        echo -e '\n ~~~~~~~~~~~~~~ Moving from Downloads.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --exclude desktop.ini "$downloads" "$temp"
        find "$downloads" -depth -type d -empty -delete
        echo -e '\n ~~~~~~~~~~~~~~ Moving from Documents.... ~~~~~~~~~~~~~~\n'
        rsync -avhz --progress --stats --ignore-existing --remove-source-files --include=\*.docx --include=\*.doc --include=\*.pdf --include=\*xlsx --exclude=\*  "$documents" "$temp"
        echo -e '\n ~~~~~~~~~~~~~~ Finished! ~~~~~~~~~~~~~~\n'
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 mv -t "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 | xargs -0 -I {} cp -p -r  {} "$temp"
        # find "$downloads"-mindepth 1 -not -name '*.ini' -print0 -exec {} cp -p -r  {} "$temp" \;
    }

    help() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '           x  | Exit'
        echo    '           b  | Go Back'
        echo    '       Backup:'
        echo    '           1  | Main Drive'
        echo    '           2  | Mobile SD Card'
        echo    '       Restore:'
        echo    '           3  | Main Drive'
        echo    '           4  | Mobile SD Card'
        echo    '       Clone:'
        echo    '           5  | Main Drive'
        echo    '           6  | Mobile SD Card'
        echo    '       Move:'
        echo    '           7  | ALL from Windows Temporary Directories'
        echo -e '           8  | Screenshots\n'
        read -e -p "  Enter Option: " input
        echo
    }

    if [ -z $1 ] ; then
        help
    else
        input=$1
        input2=$2
    fi

    case $input in
        1)  main_backup ;;
        2)  mobile_backup ;;
        3)  main_restore ;;
        4)  mobile_restore ;;
        5)  main_clone ;;
        6)  mobile_clone ;;
        7)  move_all ;;
        8)  move_screenshots ;;
        b)  manage ;;
        x)  : && clear ;;
        *)  move ;;
    esac

    functions=(
        "help"
        "main_backup"
        "mobile_backup"
        "main_restore"
        "mobile_restore"
        "main_clone"
        "mobile_clone"
        "move_all"
        "move_screenshots"
        "clone"
        "backups"
    )

    variables=(
        "input"
        "input2"
        "robocopyoptions"
        "robonorm"
        "ryncoptions"
        "excludeddir"
        "sdcard"
        "drivedwin"
        "dotfilesdird"
        "dotfilesdire"
        "drived"
        "bakcupdire"
        "logdir"
        "logfile"
        "workspacedird"
        "workspacedire"
        "link_dir_1"
        "link_dir_2"
        "screenshotsdir"
        "animemain"
        "animepicsdir"
        "animepicsdirwin"
        "acerscreendir"
        "surfscreendir"
        "downloads"
        "documents"
        "temp"
    )

    unset -f "${functions[@]}";
    unset -v functions "${variables[@]}" variables;
}
