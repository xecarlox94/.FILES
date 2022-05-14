import XMonad

main :: IO()

main = xmonad def
    {
        terminal    = "urxvt",
        borderWidth = 1
    }
