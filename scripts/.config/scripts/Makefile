
all: install

install:
	mkdir -p ~/.config/_backup
	mv ~/.bash_profile ~/.config/_backup 2>/dev/null
	mv ~/.bash_logout ~/.config/_backup 2>/dev/null
	mv ~/.bashrc ~/.config/_backup 2>/dev/null
	mv ~/.profile ~/.config/_backup 2>/dev/null


uninstall:
	mv ~/.config/_backup ~/.bash_profile 2>/dev/null
	mv ~/.config/_backup ~/.bash_logout 2>/dev/null
	mv ~/.config/_backup ~/.bashrc 2>/dev/null
	mv ~/.config/_backup ~/.profile 2>/dev/null
	rm -rf ~/.config/_backup/
