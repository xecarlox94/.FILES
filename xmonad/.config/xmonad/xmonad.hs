import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Run


main :: IO()

main = do
    xmproc <- spawnPipe "set_kb.sh"
    xmproc <- spawnPipe "set_wallpaper_theme.sh"
    xmonad def {
        terminal    = "alacritty",
        borderWidth = 1
    } -- `additionalKeys` myKeys
