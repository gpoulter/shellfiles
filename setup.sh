#!/bin/bash

CONF="$(dirname $(readlink -f $BASH_SOURCE))"

# Configure main config files to reference these ones
declare -A configs
configs['.bashrc']="source $CONF"
configs['.screenrc']="source $CONF"
configs['.inputrc']="\$include $CONF"
configs['.hgrc']="%include $CONF"

# Insert the includes on line 1 of the file
function install {
    for file in "${!configs[@]}"; do
        val=${configs["$file"]}
        if ! [[ -s ~/$file ]]; then
            echo "echo $val > ~/$file"
            echo $val > ~/$file
        elif ! grep -q "$val" ~/$file; then
            if [[ "$file" != '.bashrc' ]]; then
                echo "sed -i "1i $val" ~/$file"
                sed -i "1i $val" ~/$file
            else
                echo "echo $val >> ~/$file"
                echo $val >> ~/$file
            fi
        fi
    done
    # Link files that lack inclusion
    for rc in nanorc pylintrc; do
        if ! [[ -e ~/.$rc ]] || ! diff -u ~/.$rc $CONF/$rc; then
            ln -vs $CONF/$rc ~/.$rc
        fi
    done
}

# Remove the includes
function uninstall {
    for file in "${!configs[@]}"; do
        val=${configs["$file"]}
        if grep -q "$val" ~/$file; then
            echo "sed -i "\@^$val@d" ~/$file"
            sed -i "\@^$val@d" ~/$file
            [[ -s ~/$file ]] || rm -v ~/$file
        fi
    done
    for rc in nanorc pylintrc; do
        [[ -e ~/.$rc ]] && diff -q ~/.$rc $CONF/$rc && rm -v ~/.$rc
    done
}

FUNC=install
[[ -n $1 ]] && FUNC=$1
$FUNC
