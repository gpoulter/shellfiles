# Get this config using source ~/.conf/bashrc

## Stop for non-interactive shells
[[ $- == *i* ]] || return 0

## Load system-wide definitions
#[[ -f /etc/bashrc ]] && source /etc/bashrc
#[[ -f /etc/bash.bashrc ]] && source /etc/bash.bashrc

## Load system-wide completions
#[[ -f /etc/bash_completion ]] && source /etc/bash_completion

## Load interactive definitions

export CONF="$(dirname $(readlink -f $BASH_SOURCE))"
source $CONF/modules/pathmunge
source $CONF/modules/cygwin
source $CONF/modules/commands
source $CONF/modules/histconf
source $CONF/modules/lsconf
source $CONF/modules/lessconf
source $CONF/modules/prompt

## Set the prompt color
#prompt_colorator `ansifg green` `ansifg magenta` `ansifg blue`

## Customise config file locations
export WGETRC="$CONF/wgetrc"
export PYTHONSTARTUP="$CONF/pythonrc.py"

## Local configuration
#[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases
