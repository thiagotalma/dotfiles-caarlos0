#!/bin/sh
curl -fLso ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall </dev/tty
vim +PlugUpdate +qall </dev/tty

if which neovim >/dev/null 2>&1; then
	curl -fLso ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	mkdir -p ~/.config/nvim/
	ln -sf "$DOTFILES/vim/vimrc.symlink" ~/.config/nvim/init.vim
	nvim +PlugInstall </dev/tty
	nvim +PlugUpdate </dev/tty
fi
