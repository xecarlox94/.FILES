#!/bin/sh



aura -Slq | fzf --multi --preview 'aura -Si {1}' | xargs -ro sudo aura -S --noconfirm
