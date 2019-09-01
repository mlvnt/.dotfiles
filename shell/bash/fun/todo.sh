#   -------------------------------
#   MANAGE TODOS
#   -------------------------------

todo() {
    help() {
        echo
        echo -e '\n  Available Options:\n'
        echo    '           x  | exit   | Exit'
        echo    '           b  | back   | Go Back'
        echo    '       CLI:'
        echo    '           1  | Add'
        echo    '           2  | Done'
        echo    '           3  | Delete, Replace, Append'
        echo    '           4  | List'
        echo    '           5  | Help'
        echo    '           6  | Open todo.txt Dir'
        echo    '       GUI:'
        echo -e '           7  | Start GUI\n'
        read -e -p "  Enter Option: " input
        echo
    }

    refresh() {
        echo
        read -p "Press enter to continue"
        todo
    }

    add() {
        clear
        echo "  New TASK [PRIORITY TASK PROJECT TAG DUE]"
        echo "  Press 'c' to cancel" && echo
        read -e -p "  Task: " task

        case "$task" in
            "") add ;;
            c)  : ;;
            *)
                read -e -p "  Project : " project
                read -e -p "  Tag : " tag
                read -e -p "  Priority [A-Z] : " Priority
                read -e -p "  Due Date [yy-mm-dd]: " due

                if [ -z "$tag" ] ; then
                    $tag
                else
                    tag=+$tag
                fi;

                if [ -z "$project" ] ; then
                    $project
                else
                    project=@$project
                fi;

                if [ -z "$priority" ] ; then
                    $priority
                else
                    priority='('$priority')'
                fi;

                if [ -z "$due" ] ; then
                    $due
                else
                    due=due:$due
                fi;

                echo && todo.sh -t add $priority $task $project $tag $due ;;
        esac

        echo && todo.sh -z -P list && echo
        refresh
    }

    completed() {
        clear && echo && todo.sh -z -P -@ -+ list && echo
        read -e -p "  Task ID to mark as done: " ID
        echo && todo.sh -A do $ID && echo
        echo && todo.sh listfile done.txt && echo
        refresh
    }

    manage_todo() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Delete'
        echo    '       2  | Replace'
        echo -e '       3  | Append\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)
                clear && echo && todo.sh -z -P -@ -+ list && echo
                echo "  Delete TASK"
                echo "  Delete TASK [TERM]" && echo
                read -e -p "  Task ID to delete: " ID
                read -e -p "  Term to delete: " term
                todo.sh del $ID $term
                echo && todo.sh -z -P -@ -+ list && echo
                refresh ;;
            2)
                clear && echo && todo.sh -z -P -@ -+ list && echo
                echo "  Replace TASK [NEW TERM]" && echo
                read -e -p "  Task ID to replace: " ID
                read -e -p "  Term to replace: " term
                todo.sh replace $ID $term
                echo && todo.sh -z -P -@ -+ list && echo
                refresh ;;
            3)
                clear && echo && todo.sh -z -P -@ -+ list && echo
                echo "  Append TASK [NEW TERM]" && echo
                read -e -p "  Task ID to append to: " ID
                read -e -p "  Term to append: " term
                todo.sh append $ID $term
                echo && todo.sh -z -P -@ -+ list && echo
                refresh ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  manage ;;
        esac
    }

    list() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | List Todo'
        echo    '       2  | List Todo [yy-mm-dd @ +]'
        echo    '       3  | List Done'
        echo    '       4  | List by Project'
        echo -e '       5  | List by Tag\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)
                clear && echo && todo.sh -z -P -@ -+ list && echo
                refresh ;;
            2)
                clear && echo && todo.sh -P list && echo
                refresh ;;
            3)
                clear && echo && todo.sh listfile done.txt && echo
                refresh ;;
            4)
                clear && echo -e "\nProjecs Available:\n" && todo.sh listcon
                echo && read -e -p "  Project : " project
                echo && clear && echo && todo.sh -z -@ list @$project && echo
                refresh ;;
            5)
                clear && echo -e "\nTags Available:\n" && todo.sh listproj
                echo && read -e -p "  Tag : " tag
                echo && clear && echo && todo.sh -z -+ list +$tag && echo
                refresh ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  list ;;
        esac
    }

    helpt() {
        clear
        echo -e '\n  Available Options:\n'
        echo    '       x  | Exit'
        echo    '       b  | Go Back'
        echo    '       1  | Short'
        echo -e '       2  | Long\n'
        read -e -p "  Your Choice: " input

        case $input in
            1)  todo.sh shorthelp && todo ;;
            2)  todo.sh help && todo ;;
            b)  todo ;;
            x)  : && clear ;;
            *)  helpt ;;
        esac
    }

    local guipath="${aps}\productivity\notes\jdotxt"
    local todotxtpath="$(wslpath -w ${local})\mobile\notebook\productivity\todo\todo.txt"
    clear && echo && todo.sh -z -P -@ -+ list && echo
    read -p "Press enter to continue"
    help

    case $input in
        1)  add ;;
        2)  completed ;;
        3)  manage_todo ;;
        4)  list ;;
        5)  helpt ;;
        6)  o $todotxtpath && refresh ;;
        7)  cmds "${guipath}" jdotxt-0.4.8.jar
            refresh ;;
            # java -jar jdotxt-0.4.8.jar
        b|back)  mywork ;;
        x|exit)  : && clear ;;
        *)  todo ;;
    esac

    functions=(
        "add"
        "completed"
        "manage_todo"
        "list"
        "helpt"
        "help"
    )

    unset -f "${functions[@]}";
    unset -v functions;
}
