
all: bootstrap

bootstrap:
	mkdir -p ~/.config/_backup/home
	./mv.sh ~/.bash_profile 	~/.config/_backup/home
	./mv.sh ~/.bash_logout 		~/.config/_backup/home
	./mv.sh ~/.bashrc 		~/.config/_backup/home
	./mv.sh ~/.profile 		~/.config/_backup/home
	./mv.sh ~/.Xresources 		~/.config/_backup/home
	./mv.sh ~/.profile 		~/.config/_backup/home
	./mv.sh ~/.zprofile 		~/.config/_backup/home
	./mv.sh ~/.gitconfig 		~/.config/_backup/home
	./mv.sh ~/.xinitrc 		~/.config/_backup/home
	./stow.sh


restore:
	./unstow.sh
	mv ~/.config/_backup/home/* ~
	rm -rf ~/.config/_backup

