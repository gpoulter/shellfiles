#!/bin/bash

CONF="$(dirname $(readlink -f $BASH_SOURCE))"

# Configure main config files to reference these ones
declare -A configs
configs['.bashrc']='source ~/.conf/bashrc'
configs['.tmux.conf']='source-file ~/.conf/tmux.conf'
configs['.screenrc']='source ~/.conf/screenrc'
configs['.inputrc']='$include ~/.conf/inputrc'
configs['.vimrc']='source ~/.conf/vimrc'
configs['.hgrc']='%include ~/.conf/hgrc'

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
    # Copy files that lack inclusion
    if ! [[ -f ~/.nanorc ]] || ! diff -u ~/.nanorc $CONF/nanorc; then cp -iv $CONF/nanorc ~/.nanorc; fi
    [[ -f ~/.vim/vimpython ]] || ln -vs $CONF/vimpython ~/.vim/vimpython
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
    [[ -f ~/.nanorc ]] && diff -q ~/.nanorc $CONF/nanorc && rm -v ~/.nanorc
    [[ -L ~/.vim/vimpython ]] && rm -v ~/.vim/vimpython
}

$1
