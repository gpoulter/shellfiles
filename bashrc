# Get this config using source ~/.conf/bashrc

## Stop for non-interactive shells
[[ $- == *i* ]] || return 0

## Load interactive definitions

export CONF="$(dirname $(readlink -f $BASH_SOURCE))"
source $CONF/modules/pathmunge
source $CONF/modules/cygwin
source $CONF/modules/commands
source $CONF/modules/histconf
source $CONF/modules/lsconf
source $CONF/modules/lessconf
source $CONF/modules/prompt

## Customise config file locations
[ ! -f ~/.wgetrc -a -z "$WGETRC" ] && export WGETRC="$CONF/wgetrc"
[ ! -f ~/.inputrc -a -z "$INPUTRC" ] && export INPUTRC="$CONF/inputrc"
[[ -z "$PYTHONSTARTUP" ]] && export PYTHONSTARTUP="$CONF/pythonrc.py"

## Set the prompt color
#prompt_colorator `ansifg green` `ansifg magenta` `ansifg blue`

