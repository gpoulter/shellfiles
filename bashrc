## Load system-wide definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

## Stop here for non-interactive shells
[[ $- == *i* ]] || return 0

## Load system-wide completions
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

## Load interactive definitions

MOD="$(readlink -f $0)/modules"
source $MOD/pathmunge
source $MOD/cygwin
source $MOD/commands
source $MOD/history
source $MOD/listing
source $MOD/prompt
source $MOD/promptcolor

## Set the prompt color
prompt_colorator `ansifg green` `ansifg green` `ansifg blue`

## Local configuration
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
