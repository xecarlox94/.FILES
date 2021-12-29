#!/bin/sh

aura -Qeq | fzf --multi --preview 'aura -Qi {1}' | xargs -ro sudo aura -Rns --noconfirm
