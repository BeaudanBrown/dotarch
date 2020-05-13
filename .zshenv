# Adds `~/.local/bin/` and all subdirectories to $PATH
mkdir -p $HOME/.local/bin >/dev/null 2>&1
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# ~/ Cleanup
[ -f "$HOME/.config/python/pythonrc" ] && export PYTHONSTARTUP="$HOME/.config/python/pythonrc"
export GNUPGHOME="$HOME/.config/gnupg"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="google-chrome-stable"

ZDOTDIR="$HOME/.config/zsh"
