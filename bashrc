## Load system-wide definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

## Stop here for non-interactive shells
[[ $- == *i* ]] || return 0

## Load system-wide completions
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

## Load interactive definitions

MOD="$(dirname $(readlink -f $BASH_SOURCE))/modules"
source $MOD/pathmunge
source $MOD/cygwin
source $MOD/commands
source $MOD/histconf
source $MOD/lsconf
source $MOD/lessconf
source $MOD/prompt

## Set the prompt color
prompt_colorator `ansifg green` `ansifg green` `ansifg blue`

## Custom config file locations
export WGETRC="$MOD/wgetrc"
export PYTHONSTARTUP="$MOD/pythonrc.py"

## Local configuration
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
