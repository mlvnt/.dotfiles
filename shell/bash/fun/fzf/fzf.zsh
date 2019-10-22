# Setup fzf
# ---------
if [[ ! "$PATH" == */home/mlvnt/.fzf/bin* ]]; then
  export PATH="$PATH:/home/mlvnt/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/mlvnt/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/mlvnt/.fzf/shell/key-bindings.zsh"

