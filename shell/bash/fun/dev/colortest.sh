#!/bin/bash

colortest() {

    256colors() {
        # If the '-e' flag is passed, cells will be three rows high.
        if [ "$1" == "-e" ]; then
            local expanded=true;
        else
            local expanded=false
        fi

        # If the option --sixteen is given, only show the first 16 colors
        if [ "$1" == "-16" ]; then
            local showall=true;
            local sixteen=true;
            local expanded=true;
        else
            local sixteen=false
        fi

        # Creates a color row.
        # Arguments:
        #   - width (number)
        #   - starting color (number)
        #   - ending color (number)
        row () {
            # Give the arguments names for scope reasons.
            local width=$(($1 - 2))
            local start=$2
            local end=$3

            # Creates a "slice" (one terminal row) of a row.
            # Can be have number labels or be blank.
            # Arguments:
            #   - label (boolean)
            slice () {
                for ((i=$start; i<=$end; i++))
                do
                    # Determine if there will be a label on this cell (this is actually
                    # a per slice setting but the title needs to be set on each cell
                    # because of the numbering).
                    if [ $1 ]; then string=$i; else string=' '; fi

                    # Change background to the correct color.
                    tput setab $i

                    # Print the cell.
                    printf "%${width}s " $string
                done

                # Clear the coloring to avoid nasty wrapping colors.
                tput sgr0
                echo
            }

            if [ $expanded == true ]; then
                # Print a blank slice, a labeled one, and then a blank one.
                slice; slice true; slice
            else
                # Just print the labeled slice.
                slice true
            fi
        }

        display () {

            # Get the widths based on columns.
            local cols=$(tput cols);
            local sixth=$(($cols/6/2));
            local eighth=$(($cols/8/2));
            local twelfth=$(($cols/12/2));

            # Give it some room to breathe.
            echo

            # The first sixteen colors.
            row $eighth 0 7
            row $eighth 8 15
            echo

            if [ $sixteen == true ]; then
                exit
            fi

            # 16-231.
            for ((a=0; a<=35; a++))
            do
                row $sixth $((16 + (6 * a))) $((21 + (6 * a)))
            done
            echo

            # Greyscale.
            row $twelfth 232 243
            tput setaf 0
            row $twelfth 244 255

            # Clear before exiting.
            tput sgr0
            echo
        }

        # Show that table thang!
        display
    }

    colortheme() {
        local T='▆ ▆'
        echo -e "\n             dft     blk     red     grn     yel     blu     mag     cyn     wht";
        echo -e "             def     40m     41m     42m     43m     44m     45m     46m     47m";
        local lst=('dft    ' '       ' 'blk    ' '    90m' 'red    ' '    91m' 'grn    ' \
                  '    92m' 'yel    ' '    93m' 'blu    ' '    94m' 'mag    ' '    95m' \
                  'cyn    ' '    96m' 'wht    ' '    97m');
        local count=0;

        for FGs in '    m' '   1m' '  30m' '1;30m' '  31m' '1;31m' '  32m' \
                '1;32m' '  33m' '1;33m' '  34m' '1;34m' '  35m' '1;35m' \
                '  36m' '1;36m' '  37m' '1;37m'; do
            local FG=${FGs// /};
            echo -en "${lst[${count}]} $FGs \033[$FG  $T  ";
            local count=$(( ${count} + 1 ))
            for BG in 40m 41m 42m 43m 44m 45m 46m 47m; do
                echo -en "$EINS \033[$FG\033[$BG  $T  \033[0m";
            done;
            echo;
        done;
        echo;
    }

    colorpanes() {
        local f=3; local b=4;
        for j in f b; do
            for i in {0..7}; do
                printf -v ${j}${i} %b "\e[${!j}${i}m";
            done;
        done;
        local d=$'\e[1m';
        local t=$'\e[0m';
        local v=$'\e[7m';

        echo -e "\n   black   red   green  yellow  blue magenta  cyan  white ";
        cat <<-EOF

			    $f0████$d▄$t  $f1████$d▄$t  $f2████$d▄$t  $f3████$d▄$t  $f4████$d▄$t  $f5████$d▄$t  $f6████$d▄$t  $f7████$d▄$t
			    $f0████$d█$t  $f1████$d█$t  $f2████$d█$t  $f3████$d█$t  $f4████$d█$t  $f5████$d█$t  $f6████$d█$t  $f7████$d█$t
			    $f0████$d█$t  $f1████$d█$t  $f2████$d█$t  $f3████$d█$t  $f4████$d█$t  $f5████$d█$t  $f6████$d█$t  $f7████$d█$t
			    $d$f0 ▀▀▀▀  $d$f1 ▀▀▀▀   $f2▀▀▀▀   $f3▀▀▀▀   $f4▀▀▀▀   $f5▀▀▀▀   $f6▀▀▀▀   $f7▀▀▀▀$t

		EOF
    }

    256colors -e
    colortheme
    colorpanes

    unset -f row slice 256colors colortheme colorpanes
}
colortest
