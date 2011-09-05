Fork the repository and tweak settings to taste, or just copy interesting parts.

Pulling repo to ~/.conf (or other directory) and run "./setup.sh install".

This  will insert include lines to reference defaults from ~/.conf for the following files::
 .bash_aliases
 .tmux.conf
 .screenrc
 .inputrc
 .vimrc
 .hgrc

Thereafter "hg pull -u" will update the configuration.   

This script does not overwrite any files, except for ~/.nanorc, for which a prompt is given.

To uninstall, run "./setup.sh uninstall", which reverses everything done by "./setup.sh install"


