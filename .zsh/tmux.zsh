# Tmux plugin configuration for oh-my-zsh
# Disable plugin autostart - we handle it manually below for unique session names
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTONAME_SESSION=false

# Auto-start tmux — skip inside VS Code and existing tmux sessions
if [[ -z "$TMUX" ]] && [[ "$TERM_PROGRAM" != "vscode" ]] && command -v tmux &>/dev/null; then
    if [[ "$TERM_PROGRAM" == "ghostty" ]] && command -v tmuxinator &>/dev/null; then
        # In Ghostty: offer to attach to existing work session or start fresh
        if tmux has-session -t work 2>/dev/null; then
            echo "tmux 'work' session already running."
            echo -n "Attach to it? [Y/n] "
            read -r _answer
            if [[ "$_answer" =~ ^[Nn] ]]; then
                _dir=$(basename "$PWD")
                exec tmux new-session -s "${_dir}-$$"
            else
                exec tmux attach-session -t work
            fi
        else
            exec tmuxinator start work
        fi
    else
        # Other terminals: unique session per tab
        _dir=$(basename "$PWD")
        [[ "$PWD" == "$HOME" ]] && _dir="home"
        _session_name="${_dir}-$$"
        exec tmux new-session -s "$_session_name"
    fi
fi

