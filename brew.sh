#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install `wget` 
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg
brew install gpg2

# Install more recent versions of some macOS tools.
brew install neovim 
brew install grep
brew install openssh
brew install screen
brew install gmp

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install nmap

# Install other useful binaries.
brew install ack
brew install git
brew install git-lfs
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install ssh-copy-id
brew install tree
brew install vbindiff

# Tools

brew install httpie
brew install kubectx
brew install wireshark
brew install htop
brew install asciinema
brew install bat
brew install hyperfine
brew install tmate
brew install ipcalc
brew install gh
brew install openshift-cli
brew install adr-tools
brew install gron
brew install tmux
brew install visual-studio-code
brew install jq
brew install awscli
brew install vault
brew install fzf
brew install netnewswire
brew install kap
brew install cfn-lint
brew install azure-cli
brew install mosh
brew install cloudflared
brew install act

# Container related
brew install docker
brew install minikube
brew install hyperkit
brew install stern
brew install fx
brew install yh

# Cloud related
brew install tflint

# NeoVIM
brew install neovim
brew install luarocks

# Remove outdated versions from the cellar.
brew cleanup
