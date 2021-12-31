
all: bootstrap

bootstrap:
	mkdir -p ~/.config/_home_backup
	mv ~/.bash_profile	~/.config/_home_backup 2>/dev/null
	mv ~/.bash_logout	~/.config/_home_backup 2>/dev/null
	mv ~/.bashrc		~/.config/_home_backup 2>/dev/null
	mv ~/.profile		~/.config/_home_backup 2>/dev/null
	mv ~/.Xresources	~/.config/_home_backup 2>/dev/null
	mv ~/.profile		~/.config/_home_backup 2>/dev/null
	mv ~/.zprofile		~/.config/_home_backup 2>/dev/null
	mv ~/.gitconfig		~/.config/_home_backup 2>/dev/null
	mv ~/.xinitrc		~/.config/_home_backup 2>/dev/null
	stow --adopt -Rt ~ ~/.FILES


restore:
	stow --adopt -Dt ~ ~/.FILES
	mv ~/.config/_home_backup ~/.bash_profile	2>/dev/null
	mv ~/.config/_home_backup ~/.bash_logout	2>/dev/null
	mv ~/.config/_home_backup ~/.bashrc			2>/dev/null
	mv ~/.config/_home_backup ~/.profile		2>/dev/null
	mv ~/.config/_home_backup ~/.Xresources		2>/dev/null
	mv ~/.config/_home_backup ~/.profile		2>/dev/null
	mv ~/.config/_home_backup ~/.zprofile		2>/dev/null
	mv ~/.config/_home_backup ~/.gitconfig		2>/dev/null
	mv ~/.config/_home_backup ~/.xinitrc		2>/dev/null
	rm -rf ~/.config/_home_backup/

