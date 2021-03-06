# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd extendedglob
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# Command correction
setopt correct #all

# Ignore duplicate commands and preceded by spaces
setopt hist_ignore_all_dups hist_ignore_space

# Custom keybindings
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
bindkey -M viins '^R' vi-history-search-backward
bindkey -M vicmd '^R' vi-history-search-backward
bindkey -M viins 'jj' vi-cmd-mode
# bindkey -s "^[[18~" "ls -l\n" #<F7>
bindkey -s '^P' "^Uncmpcpp\n"
#bindkey -s '^N' "^Uunmute\n"
bindkey -s '^O' "^U/usr/bin/screen -D -RR^J"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/dylan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Load user-defined aliases
source $HOME/.zsh_alias

# User functions
# Add ~/.zsh/func to func path
fpath=($HOME/.zfunc "${fpath[@]}")

# Load my functions
autoload -Uz agedu apt-upgrade backups df extract purge-old purge-conf
autoload -Uz re_ re- shorten unmute guess wearout #fix-keyring

# Custom prompt
PS1=%m:%2~%#\ 

# zle_highlight=(default)

# Use menu completion when more than 20 options available
zstyle ':completion:*' menu select=20

# Colored completion listings
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#keychain --agents 'ssh' --inherit 'any-once' --confirm --quiet
