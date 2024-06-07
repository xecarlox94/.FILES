#!/usr/bin/env nix-shell
#!nix-shell -p "haskellPackages.ghcWithPackages (p: with p; [turtle])" -i runhaskell

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


-- (leader key/key combination) for program
-- key combination
--      splitV -> i
--      splitV -> i


class WindowSplit a where
    splitV :: Text -> Text
    splitH :: Text -> Text

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
    increaseV :: Text -> Text
    increaseH :: Text -> Text
    decreaseV :: Text -> Text
    decreaseH :: Text -> Text


class Zoomable a where
    zoomIn  :: Text -> Text
    zoomOut :: Text -> Text


class Buffer a where
    new         :: Text -> Text
    switch      :: Text -> Text -- Switchable class ??
    open        :: Text -> Text
    find        :: Text -> Text
    edit        :: Text -> Text
    sudoEdit    :: Text -> Text


class FileSystemControl a where
    open        :: Text -> Text

class FileSystemNav a where
    goParent    :: Text -> Text
    goInDir     :: Text -> Text

-- buffers new, switch, open, edit, save, close
-- file find, new, open, edit, save, close
-- tab new, switch, open, edit, save, close

-- plugins telescope ...
-- open terminal, console

-- evaluate in emacs and neovim

-- snippets, insert snippets


