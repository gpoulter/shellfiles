# Get this config with "source ~/.conf/bashrc"

## Stop for non-interactive shells
[[ $- == *i* ]] || return 0

## Load definitions (do nothing, except for cygwin)
export BE_CONFDIR="$(dirname $(readlink -f $BASH_SOURCE))"
source "$BE_CONFDIR/bash/dirname"
source "$BE_CONFDIR/bash/path"
source "$BE_CONFDIR/bash/history"
source "$BE_CONFDIR/bash/functions"
source "$BE_CONFDIR/bash/other"
source "$BE_CONFDIR/bash/prompt"
source "$BE_CONFDIR/bash/cygwin"

## Customise config file locations
function be_set_wgetrc {
    if ! [[ -f ~/.wgetrc ]] && [[ -z "$WGETRC" ]]; then export WGETRC="$BE_CONFDIR/wgetrc"; fi
}
function be_set_inputrc {
    if [[ -f ~/.inputrc ]] && [[ -z "$INPUTRC" ]]; then export INPUTRC="$BE_CONFDIR/inputrc"; fi
}
function be_set_pythonstart {
    if [[ -z "$PYTHONSTARTUP" ]]; then export PYTHONSTARTUP="$BE_CONFDIR/pythonrc.py"; fi
}

function be_setall_confpaths {
    be_set_wgetrc
    be_set_inputrc
    be_set_pythonstart
}

function be_setall_everything {
    be_setall_confpaths
    be_setall_other
    be_setall_funcalias
    be_setall_history
    be_setall_prompt "$@"
}
