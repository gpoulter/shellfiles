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
    if ! [[ -e ~/.nanorc ]] || ! diff -u ~/.nanorc $CONF/nanorc; then ln -vs $CONF/nanorc ~/.nanorc; fi
    [[ -e ~/.vim ]] || ln -vs $CONF/vim ~/.vim
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
    [[ -e ~/.nanorc ]] && diff -q ~/.nanorc $CONF/nanorc && rm -v ~/.nanorc
    [[ -L ~/.vim ]] && rm -v ~/.vim
}

$1
