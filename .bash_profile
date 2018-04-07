# Configurations
# Bash history
export HISTCONTROL=erasedups
export HISTSIZE=10000
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/share/npm/bin:~/bin/mongodb-osx-x86_64-enterprise-3.4.6/bin
shopt -s histappend

# Initialize rbenv
eval "$(rbenv init -)"

# Load SSH keys
ssh-add -A &> /dev/null
