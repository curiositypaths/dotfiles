# Configurations
# Bash history
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# Initialize rbenv
eval "$(rbenv init -)"

# Load SSH keys
ssh-add -A &> /dev/null
