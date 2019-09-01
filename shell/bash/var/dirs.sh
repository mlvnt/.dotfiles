#!/bin/bash
# ┳━┓o┳━┓┳━┓┏━┓┏┓┓┏━┓┳━┓┓ ┳  ┳━┓┳━┓┏┓┓┳ ┳┓━┓
# ┃ ┃┃┃┳┛┣━ ┃   ┃ ┃ ┃┃┳┛┗┏┛  ┃━┛┃━┫ ┃ ┃━┫┗━┓
# ┇━┛┇┇┗┛┻━┛┗━┛ ┇ ┛━┛┇┗┛ ┇   ┇  ┛ ┇ ┇ ┇ ┻━━┛

winhw="$(path_converter '%USERPROFILE%')";
winhl="$(wslpath -u "${winhw}")";
winhwr="$(path_converter '%HOMEDRIVE%')\\";
winhlr="$(wslpath -u "${winhwr}")";

if [[ $(currentdevice) == pc ]]; then
    aps="D:\apps";
    local="/mnt/d/shared";
    synctrayzor="${aps}\net\file-sharing";
    shared="home";
else
    aps="${winhwr%?}\shared\pc\apps";
    local="${winhlr%?}/shared";
    synctrayzor="${winhwr%?}";
    shared="shared";
fi;

dots_local=~/.dotfiles;
dots=${local}/pc/projects/dotfiles/dotfiles;
python=${local}/pc/projects/scripts/py/packages;
os=$(currentdevice -o);
