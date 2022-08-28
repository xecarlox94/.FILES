import XMonad

import XMonad.Util.Run


main :: IO()

main = do
    xmonad def {
        terminal    = "alacritty",
        borderWidth = 1
    } -- `additionalKeys` myKeys
