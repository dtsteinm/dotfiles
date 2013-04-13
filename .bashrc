# Set alias
source $HOME/.bash_alias

# Set default editor to Vim
EDITOR=/usr/bin/vim

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

#export LD_PRELOAD=/home/dylan/Downloads/Plugins/Flash/fullscreenhack-0.2/libfullscreenhack.so

# Fix slow tab scrolling in Chromium
#nvidia-settings -a InitialPixmapPlacement=0
