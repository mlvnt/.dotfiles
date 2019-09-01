# List Git Branches sorted by recent updates, adding a star to remote tracking branches
glb() {
    RED="\e[91m";
    for branch in $(git branch | sed s/^..//); do
    time_ago=$(git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $branch --);
    # Add a red star to mark branches that are tracking something upstream
    tracks_upstream=$(if [ "$(git rev-parse $branch@{upstream} 2>/dev/null)" ]; then printf "$RED?"; fi);
    printf "%-53s - %s %s\n" $time_ago $branch $tracks_upstream;
    done | sort;
}

alias undopush="git push -f origin HEAD^:master"  # Undo a `git push`
# alias g="git"
alias gf="git fetch && git pull"
alias gac='git add -A && git commit -a && git push'
alias ga='git add -A'
# alias gph='git push'
# alias gpl='git pull'
# alias gl='git log'
# alias gg='git graph'
# alias gs='git status'
# alias gc='git commit'
# alias gcl='git clone'
# alias gd='git diff'
# alias go='git checkout'
# alias gb='git branch'
# alias gbl='git blame'
