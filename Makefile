.PHONY: install vim init
PWD=$$(pwd)

install: init vim

init:
	git pull origin master
	git submodule init && git submodule update --merge --recursive

vim:
	rm -rf $${HOME}/.vim $${HOME}/.vimrc
	ln -s ${PWD}/vim/.vim $${HOME}/.vim
	ln -s ${PWD}/vim/.vimrc $${HOME}/.vimrc
	rm -rf $${HOME}/.fzf
	git clone --depth 1 https://github.com/junegunn/fzf.git $${HOME}/.fzf
	$${HOME}/.fzf/install

