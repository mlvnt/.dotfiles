#!/bin/bash
#
# Inspired by https://github.com/holman/dotfiles
#

###############################################################################
#   SETUP                                                                     #
###############################################################################

IGNORE=(
    ".git"
    ".gitignore"
    ".gitmodules"
    "README.md"
    ".DS_Store"
)

DOTFILES_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo ''

info () {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
}

link_file () {
    local src=$1 dst=$2

    local overwrite= backup= skip=
    local action=

    if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
    then

        if [ "$overwrite_all" == "false" ] && \
               [ "$backup_all" == "false" ] && \
               [ "$skip_all" == "false" ]
        then

            local currentSrc="$(readlink $dst)"

            if [ "$currentSrc" == "$src" ]
            then

                skip=true;

            else
                user "File already exists: $dst ($(basename "$src")), \
what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, \
[O]verwrite all, [b]ackup, [B]ackup all?"

                read -n 1 action

                case "$action" in
                    o )
                        overwrite=true;;
                    O )
                        overwrite_all=true;;
                    b )
                        backup=true;;
                    B )
                        backup_all=true;;
                    s )
                        skip=true;;
                    S )
                        skip_all=true;;
                    * )
                    ;;
                esac

            fi

        fi

        overwrite=${overwrite:-$overwrite_all}
        backup=${backup:-$backup_all}
        skip=${skip:-$skip_all}

        if [ "$overwrite" == "true" ]
        then
            rm -rf "$dst"
            success "removed $dst"
        fi

        if [ "$backup" == "true" ]
        then
            mv "$dst" "${dst}.backup"
            success "moved $dst to ${dst}.backup"
        fi

        if [ "$skip" == "true" ]
        then
            success "skipped $src"
        fi
    fi

    if [ "$skip" != "true" ]  # "false" or empty
    then
        ln -s "$1" "$2"
        success "linked $1 to $2"
    fi
}

install_dotfiles () {
    info 'installing dotfiles'

    local overwrite_all=false backup_all=false skip_all=false

    for src in $(find "$DOTFILES_ROOT" -mindepth 1 -maxdepth 1)
    do
        if [[ "${IGNORE[@]}" =~ "$(basename $src)" ]]
        then
            continue
        fi
        dst="$HOME/.$(basename "$src")"
        link_file "$src" "$dst"
    done
}

###############################################################################
#   USER SYMBLINKS                                                            #
###############################################################################

install_bin () {
    info 'installing bin'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/bin"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_config () {
    info 'installing config'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/.config"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_dir_colors () {
    info 'installing dir_colors'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/theming/.dir_colors"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_fonts () {
    info 'installing fonts'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/theming/.fonts"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_local () {
    info 'installing local'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/.local"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_nano () {
    info 'installing nano'
    local overwrite_all=true backup_all=false skip_all=false
    src="$DOTFILES_ROOT/editors/.nano"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_vim () {
    info 'installing vim'
    local overwrite_all=true backup_all=false skip_all=false

    src="$DOTFILES_ROOT/editors/.vim"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/editors/.vimrc"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_bash () {
    info 'installing bash'
    local overwrite_all=true backup_all=false skip_all=false

    src="$DOTFILES_ROOT/shell/bash/.bashrc"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/bash/.bash_profile"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/bash/.bash_aliases"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/bash/.bash_functions"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/bash/.bash_logout"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"
}

install_zsh () {
    info 'installing zsh'
    local overwrite_all=true backup_all=false skip_all=false

    src="$DOTFILES_ROOT/shell/zsh/.oh-my-zsh"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/zsh/.oh-my-zsh-custom"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/shell/zsh/.zshrc"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"   
}

install_git () {
    info 'installing git'
    local overwrite_all=true backup_all=false skip_all=false

    src="$DOTFILES_ROOT/git/.gitconfig"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/git/.gitattributes"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"

    src="$DOTFILES_ROOT/git/.gitignore"
    dst="$HOME/$(basename "$src")"
    link_file "$src" "$dst"     
}

# install_emacs () {
#     info 'installing emacs'
#     local overwrite_all=true backup_all=false skip_all=false
#     src="$DOTFILES_ROOT/editors/.emacs"
#     dst="$HOME/$(basename "$src")"
#     link_file "$src" "$dst"
# }

# install_tmux () {
#     info 'installing tmux'
#     local overwrite_all=true backup_all=false skip_all=false

#     src="$DOTFILES_ROOT/tmux/.tmux.conf"
#     dst="$HOME/$(basename "$src")"
#     link_file "$src" "$dst"

#     src="$DOTFILES_ROOT/tmux/.tmuxcolors.conf"
#     dst="$HOME/$(basename "$src")"
#     link_file "$src" "$dst"
# }

# install_curl () {
#     info 'installing curl'
#     local overwrite_all=true backup_all=false skip_all=false
#     src="$DOTFILES_ROOT/net/.curlrc"
#     dst="$HOME/$(basename "$src")"
#     link_file "$src" "$dst"
# }

# install_wget () {
#     info 'installing wget'
#     local overwrite_all=true backup_all=false skip_all=false
#     src="$DOTFILES_ROOT/net/.wgetrc"
#     dst="$HOME/$(basename "$src")"
#     link_file "$src" "$dst"
# }

printf '\n      Setting up symbolic links....\n\n'

install_dotfiles
echo ''
install_bin
echo ''
install_dir_colors
echo ''
install_config
echo ''
install_zsh
echo ''
install_git
echo ''
install_local
echo ''
install_nano
echo ''
install_vim
echo ''
install_bash
# echo ''
# install_emacs
# echo ''
# install_tmux
# echo ''
# install_curl
# echo ''
# install_wget

echo ''
echo '  All installed!'

#=============================================================================================================