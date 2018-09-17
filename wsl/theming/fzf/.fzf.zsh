# Setup fzf
# ---------
if [[ ! "$PATH" == */home/todorov/.fzf/bin* ]]; then
  export PATH="$PATH:/home/todorov/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/todorov/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/todorov/.fzf/shell/key-bindings.zsh"

