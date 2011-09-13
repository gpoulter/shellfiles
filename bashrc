# Get this config with "source ~/.conf/bashrc"

## Stop for non-interactive shells
[[ $- == *i* ]] || return 0

## Load interactive definitions

CONF="$(dirname $(readlink -f $BASH_SOURCE))"
source "$CONF/bash/dirname"
source "$CONF/bash/path"
source "$CONF/bash/history"
source "$CONF/bash/cygwin"
source "$CONF/bash/functions"
source "$CONF/bash/ls"
source "$CONF/bash/less"
source "$CONF/bash/prompt"

## Customise config file locations
[ ! -f ~/.wgetrc -a -z "$WGETRC" ] && export WGETRC="$CONF/wgetrc"
[ ! -f ~/.inputrc -a -z "$INPUTRC" ] && export INPUTRC="$CONF/inputrc"
[[ -z "$PYTHONSTARTUP" ]] && export PYTHONSTARTUP="$CONF/pythonrc.py"

## Set the prompt color
#prompt_colorator `ansifg green` `ansifg magenta` `ansifg blue`

