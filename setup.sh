#!/bin/sh

deploy_files() {
    if [ ! -e ~/dotfiles/$1 ]; then
        echo "Error!!! : ~/dotfiles/$1 is not exist.";
        return;
    fi

    if [ ! -e ~/$1 ]; then
        ln -s ~/dotfiles/$1 ~/$1;
    else
        echo "Exist : $1";
    fi
}

deploy_files .zshrc
deploy_files .screenrc
deploy_files .vimrc
deploy_files .dein.toml
deploy_files .gitconfig
deploy_files .gitignore.global

# vimdoc-ja
if [ ! -e ~/.vim ]; then
    mkdir ~/.vim/;
fi

if [ ! -e ~/.vim/doc ]; then
    ln -s ~/dotfiles/vimdoc-ja/doc/ ~/.vim/doc;
else
    echo "Exist : doc";
fi

if [ ! -e ~/.vim/syntax ]; then
    ln -s ~/dotfiles/vimdoc-ja/syntax/ ~/.vim/syntax;
else
    echo "Exist : syntax";
fi

if [ ! -e ~/.vim/after ]; then
    ln -s ~/dotfiles/.vim/after ~/.vim;
else
    echo "Exist : .vim/after/";
fi

