# Zsh Configuration for Ghostty + Tmux Workflow

This directory contains modular zsh configurations that enhance your terminal workflow with Ghostty and tmux.

## Files

- `ghostty.zsh` - Ghostty-specific optimizations and shell integration
- `tmux.zsh` - Tmux configuration for oh-my-zsh plugins and environment
- `plugins.md` - Documentation of recommended oh-my-zsh plugins

## Installation

After running `./custom-setup.sh`, add these lines to your `~/.zshrc`:

```zsh
# Load enhanced terminal configurations
[[ -f ~/.zsh/ghostty.zsh ]] && source ~/.zsh/ghostty.zsh
[[ -f ~/.zsh/tmux.zsh ]] && source ~/.zsh/tmux.zsh
```

## Plugin Configuration

Update your oh-my-zsh plugins line in `~/.zshrc` to:

```zsh
plugins=(git tmux z fzf colorize command-not-found copypath copyfile)
```

Then add the tmux plugin configuration (from `tmux.zsh`) before sourcing oh-my-zsh:

```zsh
# Tmux plugin configuration (must be before sourcing oh-my-zsh)
export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOSTART_ONCE=false
export ZSH_TMUX_AUTOCONNECT=false
export ZSH_TMUX_AUTOQUIT=false
export ZSH_TMUX_FIXTERM=true
export ZSH_TMUX_AUTONAME_SESSION=true

source $ZSH/oh-my-zsh.sh

# Load terminal-specific enhancements (after oh-my-zsh)
[[ -f ~/.zsh/ghostty.zsh ]] && source ~/.zsh/ghostty.zsh
[[ -f ~/.zsh/tmux.zsh ]] && source ~/.zsh/tmux.zsh
```

## What This Provides

- **Ghostty Integration**: True color support, shell integration, better history
- **Tmux Workflow**: Auto-start, separate sessions per tab, enhanced navigation
- **Enhanced Plugins**: Better file operations, fuzzy finding, syntax highlighting
- **Amazon Q CLI**: Auto-detection and completion support

## Dependencies

Make sure you have installed:
- `fzf` (fuzzy finder): `brew install fzf`
- `ghostty` (terminal): `brew install ghostty`

## Verification

After setup, check your integration with:
```zsh
sysinfo  # New alias to show terminal/tmux status
```