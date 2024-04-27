#!/usr/bin/env nix-shell
#!nix-shell -p "haskellPackages.ghcWithPackages (p: with p; [turtle])" -i ghci

{-# LANGUAGE OverloadedStrings #-}

import Turtle


-- 1. Stow configs
-- 2. generate configs to each program and output them to the files
-- 3. lift configuration meta data from configs (web pages, bookmarks)
-- 4. Unstow configs


main = do
    dir <- pwd
    echo "Siuu"
    touch "file.txt"


-- Text editors (vim/nvim and emacs), tmux, window managers, browsers, terminal file managers
-- Desktop and shell Keybindings


-- window spliting
-- window movement
-- window focus
-- window resizing

-- file find, new, open, edit, save, close
-- buffers new, switch, open, edit, save, close
-- tab new, switch, open, edit, save, close
-- plugins telescope ...
-- open terminal, console

-- evaluate in emacs and neovim

-- snippets, insert snippets


