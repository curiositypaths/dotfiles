# Configurations
# Bash history
export HISTCONTROL=erasedups
export HISTSIZE=10000
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
shopt -s histappend

# This function is called in your prompt to output your active git branch.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# This function builds your prompt. It is called below
function prompt {
  # Define the prompt character
  local   CHAR="♥"
  # Define some local colors
  local   RED="\[\e[0;31m\]"
  local   BLUE="\[\e[0;34m\]"
  local   GREEN="\[\e[0;32m\]"
  local   GRAY_TEXT_BLUE_BACKGROUND="\[\e[37;44;1m\]"
  # Define a variable to reset the text color
  local   RESET="\[\e[0m\]"
  # ♥ ☆ - Keeping some cool ASCII Characters for reference

  # Here is where we actually export the PS1 Variable which stores the text for your prompt
  export PS1="\[\e]2;\u@\h\a[$GRAY_TEXT_BLUE_BACKGROUND\t$RESET]$RED\$(parse_git_branch) $GREEN\W\n$BLUE//$RED $CHAR $RESET"
  PS2='> '
  PS4='+ '
}

# Finally call the function and our prompt is all pretty
prompt

# Initialize rbenv
eval "$(rbenv init -)"

# GIT_MERGE_AUTO_EDIT
# This variable configures git to not require a message when you merge.
export GIT_MERGE_AUTOEDIT='no'

# Git Bash Completion
# Will activate bash git completion if installed
# via homebrew
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Case-Insensitive Auto Completion
bind "set completion-ignore-case on"

# Editors
# Tells your shell that when a program requires various editors, use sublime.
# The -w flag tells your shell to wait until sublime exits
export VISUAL="vim"
export SVN_EDITOR="vim"
export GIT_EDITOR="vim"
export EDITOR="vim"

# A function to easily grep for a matching process
# USE: psg postgres
function psg {
  FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
  REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
  ps aux | grep "[$FIRST]$REST"
}

# A function to extract correctly any archive based on extension
# USE: extract imazip.zip
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1      ;;
      *.tar.gz)   tar xzf $1      ;;
      *.bz2)      bunzip2 $1      ;;
      *.rar)      rar x $1        ;;
      *.gz)       gunzip $1       ;;
      *.tar)      tar xf $1       ;;
      *.tbz2)     tar xjf $1      ;;
      *.tgz)      tar xzf $1      ;;
      *.zip)      unzip $1        ;;
      *.Z)        uncompress $1   ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Aliases
# LS
alias l='ls -lah'

#Bundle
alias be='bundle exec'

#rspec
alias tspec="rspec --fail-fast"

# Git
alias gcl="git clone"
alias gst="git status"
alias gl="git pull"
alias gp="git push"
alias gd="git diff | subl"
alias gc="git commit -v"
alias gca="git commit -v -a"
alias gb="git branch"
alias gba="git branch -a"
alias gcam="git commit -am"
alias gbb="git branch -b"

# Hidden File Visibility
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
