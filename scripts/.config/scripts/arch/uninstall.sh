#!/bin/sh

pacman -Qeq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns --noconfirm
