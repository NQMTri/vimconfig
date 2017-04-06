#!/bin/bash

#################################
# FUNCTIONS
#################################
# Dummy Function
dummy_function(){
	echo "ahihi"
}

#################################
# Install Pathogen
install_pathogen () {
# Download and install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# Append script to the .vimrc file
cat <<EOT >> ~/.vimrc
"@@ PATHOGEN CONFIGURATION
execute pathogen#infect()
EOT
}

#################################
# Install NERDTree
install_NERDTree () {
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
# Append script to the .vimrc file
cat <<EOT >> ~/.vimrc
"@@ NERDTree Config
autocmd vimenter * NERDTree
EOT
}
#################################
# Asking for user confirmation to install
user_confirmation () {
# Asking for user confirmation
read -p "$1 (Enter \"Y\" or \"y\" to confirm): " -n 1 -r;
echo # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	$2;
fi
}

#################################
# PRINT LIST OF PLUGIN TO INSTALL
#################################
#################################
# RUN DUMMY FUNCTION
#################################
user_confirmation "Do you want to run this dummy function?" dummy_function

#################################
# Install Pathogen
#################################
user_confirmation "Do you want to install Pathogen plugin for your Vim?" install_pathogen

#################################
# NERDTree
#################################
user_confirmation "Do you want to install NERDTree plugin into your Vim?" install_NERDTree
#################################
# vim-airline
#################################
