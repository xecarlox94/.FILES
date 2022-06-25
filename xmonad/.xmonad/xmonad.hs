import XMonad

import XMonad.Util.Run

import XMonad.EZConfig (additionalKeys)


-- myKeys = [ ((mod4Mask, xK_f), spawn "firefox") ]

main :: IO()

main = do
    xmproc <- spawnPipe "xwallpaper --zoom Desktop/mountains_solitude_house_124060_1280x720.jpg"
    xmproc <- spawnPipe "setxkbmap gb"
    xmproc <- spawnPipe "wal -R"
    xmproc <- spawnPipe "picom --experimental-backends"
    xmonad def {
        terminal    = "alacritty",
        borderWidth = 1
    } -- `additionalKeys` myKeys
