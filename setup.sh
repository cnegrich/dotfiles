#!/bin/bash

# Take package manager as argument
PCKG=$1

# Set a directory to clone
REPOS=$HOME/Repos

# Read in user password
read -s -p "Enter Password for sudo: " PSWD

if [ "${PCKG}" = "brew" ]; then
    # Install all dependencies
    brew install zsh neovim curl python git
    easy_install pip
    pip install neovim
    `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    yes Yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
elif [ "${PCKG}" = "apt" ]; then
    # Install all dependencies
    echo $PSWD | sudo apt update
    echo $PSWD | sudo apt-get -qq --yes install zsh python3 python3-pip neovim curl git
    pip3 install neovim
    `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
    yes YES | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Implemented for: brew, apt. Otherwise only works if python3, pip, neovim python package, git, curl, zsh, oh-my-zsh, nvmim are already installed."
fi


# Make a bash profile
if [[ ! -e "${HOME}/.bash_profile" ]]; then
    touch $HOME/.bash_profile
fi

# Put all config files in place
if [[ ! -e "${REPOS}" ]]; then
    mkdir $REPOS
fi

if [[ ! -e "${REPOS}/dotfiles" ]]; then
    cd $REPOS
    `git clone https://github.com/cnegrich/dotfiles.git`
fi


if [[ ! -e "${HOME}/.config/nvim" ]]; then
    mkdir $HOME/.config/nvim
fi

/bin/cp -f $REPOS/dotfiles/.zshrc $HOME/.zshrc
/bin/cp -f $REPOS/dotfiles/.vimrc $HOME/.vimrc
/bin/cp -f $REPOS/dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim
/bin/cp -rf $REPOS/dotfiles/.zsh $HOME/

echo "Autosetup complete."
