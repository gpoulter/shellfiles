## Load system-wide definitions
[[ -f /etc/bashrc ]] && source /etc/bashrc
[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

## Stop here for non-interactive shells
[[ $- == *i* ]] || return 0

## Load system-wide completions
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

## Load interactive definitions

DIR="$(basename $0)"
source $DIR/pathmunge
source $DIR/cygwin
source $DIR/commands
source $DIR/history
source $DIR/listing
source $DIR/prompt
source $DIR/promptcolor

## Set the prompt color
prompt_colorator `ansifg green` `ansifg green` `ansifg blue`

## Local configuration
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
