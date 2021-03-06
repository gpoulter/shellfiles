#!/bin/bash

ACONF="$(dirname $(readlink -f $BASH_SOURCE))"
RCONF="${ACONF##$HOME/}"

# Configure main config files to reference these ones
declare -A configs
configs['.bashrc']="source $ACONF/bashrc"
configs['.screenrc']="source $RCONF/screenrc"
configs['.inputrc']="\$include $RCONF/inputrc"
configs['.hgrc']="%include $RCONF/hgrc"

# Work from home directory
cd "$HOME"

# Insert the includes on line 1 of the file
function install {
    for file in "${!configs[@]}"; do
        val=${configs["$file"]}
        if ! [[ -s $file ]]; then
            echo "echo $val > $file"
            echo $val > $file
        elif ! grep -q "$val" $file; then
            echo "sed -i "1i $val" $file"
            sed -i "1i $val" $file
        fi
    done
    # Link files that lack inclusion
    for rc in nanorc pylintrc; do
        if [[ ! -e .$rc ]] || ! diff -u .$rc $RCONF/$rc; then
            rm -f .$rc
            ln -vs $RCONF/$rc .$rc
        fi
    done
}

# Remove the includes
function uninstall {
    for file in "${!configs[@]}"; do
        val=${configs["$file"]}
        if grep -q "$val" $file; then
            echo "sed -i "\@^$val@d" $file"
            sed -i "\@^$val@d" $file
            [[ -s $file ]] || rm -v $file
        fi
    done
    for rc in nanorc pylintrc; do
        [[ -e .$rc ]] && diff -q .$rc $RCONF/$rc && rm -v .$rc
    done
}

FUNC=install
[[ -n $1 ]] && FUNC=$1
$FUNC

# vim:set ts=4:sts=4:sw=4:
