
all: bootstrap

bootstrap:
	mkdir -p 							~/.config/_backup/home
	./_scripts/mv.sh ~/.bash_profile 	~/.config/_backup/home
	./_scripts/mv.sh ~/.bash_logout 	~/.config/_backup/home
	./_scripts/mv.sh ~/.bashrc 			~/.config/_backup/home
	./_scripts/mv.sh ~/.profile 		~/.config/_backup/home
	./_scripts/mv.sh ~/.Xresources 		~/.config/_backup/home
	./_scripts/mv.sh ~/.profile 		~/.config/_backup/home
	./_scripts/mv.sh ~/.zprofile 		~/.config/_backup/home
	./_scripts/mv.sh ~/.gitconfig 		~/.config/_backup/home
	./_scripts/mv.sh ~/.xinitrc 		~/.config/_backup/home
	./_scripts/stow.sh


restore:
	./_scripts/unstow.sh
	./_scripts/restore_backup_files.sh
