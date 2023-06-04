#!/bin/sh



vim ~/.config/.FILES/profile/.config/.nixos_cfg/configuration.nix


sudo cp ~/.config/.FILES/profile/.config/.nixos_cfg/configuration.nix /etc/nixos/configuration.nix



sudo nixos-rebuild switch
