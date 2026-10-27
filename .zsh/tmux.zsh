# Tmux plugin configuration for oh-my-zsh
# Disable plugin autostart - we handle it manually below for unique session names
export ZSH_TMUX_AUTOSTART=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTONAME_SESSION=false

# Auto-start tmux — skip inside VS Code, non-interactive shells, existing tmux sessions,
# or when NO_TMUX is set (e.g. `NO_TMUX=1 zsh`)
if [[ -z "$TMUX" ]] && [[ "${HERDR_ENV:-}" != 1 ]] && [[ -z "$NO_TMUX" ]] && [[ "$TERM_PROGRAM" != "vscode" ]] && [[ -z "$VSCODE_RESOLVING_ENVIRONMENT" ]] && [[ -t 0 ]] && command -v tmux &>/dev/null; then
    if [[ "$TERM_PROGRAM" == "ghostty" ]] && command -v tmuxinator &>/dev/null; then
        # In Ghostty: always ask — attach/start 'work', new tmux session, or plain shell (e.g. for herdr)
        if tmux has-session -t work 2>/dev/null; then
            _first="[A]ttach to 'work' (default)"
        else
            _first="[A] start 'work' via tmuxinator (default)"
        fi
        echo -n "$_first / [n]ew tmux session / [s]hell without tmux: "
        read -r _answer
        case "$_answer" in
            [Ss]*)
                unset _answer _first
                ;;
            [Nn]*)
                _dir=$(basename "$PWD")
                [[ "$PWD" == "$HOME" ]] && _dir="home"
                exec tmux new-session -s "${_dir}-$$"
                ;;
            *)
                if tmux has-session -t work 2>/dev/null; then
                    exec tmux attach-session -t work
                else
                    exec tmuxinator start work
                fi
                ;;
        esac
    else
        # Other terminals: unique session per tab
        _dir=$(basename "$PWD")
        [[ "$PWD" == "$HOME" ]] && _dir="home"
        _session_name="${_dir}-$$"
        exec tmux new-session -s "$_session_name"
    fi
fi

