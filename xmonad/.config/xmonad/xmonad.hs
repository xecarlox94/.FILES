import XMonad

import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import XMonad.Util.Run


main :: IO()

main = xmonad (def
    { terminal  = "alacritty"
    })
