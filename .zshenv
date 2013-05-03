# Add user's home bin to path
if [[ -d $HOME/bin && ! $PATH =~ "$HOME/bin:*" ]]; then 
	export PATH=$HOME/bin:$PATH
fi

# Add sbin directory to path, if not already
if [[ ! $PATH =~ ".*sbin" ]]; then
	export PATH=$PATH:/usr/sbin:/sbin
fi

# Python Startup
export PYTHONSTARTUP=$HOME/.pythonstartup

# Use ssh-add when git asks for password
export SSH_ASKPASS=ssh-add
