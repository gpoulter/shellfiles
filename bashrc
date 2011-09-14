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
if ! [[ -f ~/.wgetrc ]] && [[ -z "$WGETRC" ]]; then export WGETRC="$CONF/wgetrc"; fi
if [[ -f ~/.inputrc ]] && [[ -z "$INPUTRC" ]]; then export INPUTRC="$CONF/inputrc"; fi
if [[ -z "$PYTHONSTARTUP" ]]; then export PYTHONSTARTUP="$CONF/pythonrc.py"; fi

## Set the prompt color
#prompt_colorator `ansifg green` `ansifg magenta` `ansifg blue`

