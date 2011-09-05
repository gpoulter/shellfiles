# Get this config with "source ~/.conf/bashrc"

## Stop for non-interactive shells
[[ $- == *i* ]] || return 0

## Load interactive definitions

CONF="$(dirname $(readlink -f $BASH_SOURCE))"
source $CONF/bash/pathmunge
source $CONF/bash/cygwin
source $CONF/bash/commands
source $CONF/bash/histconf
source $CONF/bash/lsconf
source $CONF/bash/lessconf
source $CONF/bash/prompt

## Customise config file locations
[ ! -f ~/.wgetrc -a -z "$WGETRC" ] && export WGETRC="$CONF/wgetrc"
[ ! -f ~/.inputrc -a -z "$INPUTRC" ] && export INPUTRC="$CONF/inputrc"
[[ -z "$PYTHONSTARTUP" ]] && export PYTHONSTARTUP="$CONF/pythonrc.py"

## Set the prompt color
#prompt_colorator `ansifg green` `ansifg magenta` `ansifg blue`

