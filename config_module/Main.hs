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



class WindowSplit a where
    splitUp     :: Text -> Text
    splitDown   :: Text -> Text

class WindowMovement a where
    moveUp      :: Text -> Text
    moveDown    :: Text -> Text
    moveLeft    :: Text -> Text
    moveRight   :: Text -> Text

class WindowFocus a where
    focusUp     :: Text -> Text
    focusDown   :: Text -> Text
    focusLeft   :: Text -> Text
    focusRight  :: Text -> Text

class WindowResize a where
    increaseVertically      :: Text -> Text
    increaseHorizontally    :: Text -> Text
    decreaseVertically      :: Text -> Text
    decreaseHorizontally    :: Text -> Text



class Buffer a where
    new
    switch
    open
    edit

-- buffers new, switch, open, edit, save, close
    -- file find, new, open, edit, save, close
-- tab new, switch, open, edit, save, close

-- plugins telescope ...
-- open terminal, console

-- evaluate in emacs and neovim

-- snippets, insert snippets


