# Tmux plugin configuration for oh-my-zsh
# Disable plugin autostart - we handle it manually below for unique session names
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTONAME_SESSION=false

# Auto-start tmux with a unique session name per terminal tab/window
# Only starts if not already inside a tmux session and not inside VS Code
if [[ -z "$TMUX" ]] && [[ "$TERM_PROGRAM" != "vscode" ]] && command -v tmux &>/dev/null; then
    # Build a unique session name: directory + shell PID
    _dir=$(basename "$PWD")
    [[ "$PWD" == "$HOME" ]] && _dir="home"
    _session_name="${_dir}-$$"
    exec tmux new-session -s "$_session_name"
fi

# Amazon Q CLI integration (if available)
if command -v q &> /dev/null; then
    # Add Q CLI completion if it supports it
    [[ -f ~/.config/q/completion.zsh ]] && source ~/.config/q/completion.zsh
fi