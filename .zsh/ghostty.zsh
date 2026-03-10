# Ghostty terminal optimizations
if [[ "$TERM_PROGRAM" == "ghostty" ]]; then

    # Enable true color support
    export COLORTERM=truecolor

    # Optimize for Ghostty's shell integration
    export GHOSTTY_INTEGRATION=1

    # Better history for Ghostty + tmux workflow
    export HISTSIZE=10000
    export SAVEHIST=10000
    export HISTCONTROL=ignoredups:erasedups

    # Enable shared history between panes/sessions
    setopt SHARE_HISTORY
    setopt HIST_VERIFY
    setopt HIST_EXPIRE_DUPS_FIRST
fi

# Enhanced terminal features for modern terminals
if [[ "$TERM" == *"256color"* ]] || [[ "$COLORTERM" == "truecolor" ]]; then
    # Enable better ls colors
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
fi