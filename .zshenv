# # Add user's home bin to path
# if [[ -d $HOME/bin && ! $PATH =~ "$HOME/bin:*" ]]; then 
#     export PATH="$HOME/bin:$PATH"
# fi

# # Add sbin directory to path, if not already
# if [[ ! $PATH =~ ".*sbin" ]]; then
#     export PATH="$PATH:/usr/sbin:/sbin"
# fi
source "$HOME/.profile"

# Python Startup
PYTHONSTARTUP="$HOME/.pythonstartup"

# Use ssh-add when git asks for password
SSH_ASKPASS=ssh-add

# Fix history-substring-search issue in zsh5
DEBIAN_PREVENT_KEYBOARD_CHANGES=yes

# Define directory colors
eval $(dircolors)

source "$HOME/.keychain/${HOST}-sh"
