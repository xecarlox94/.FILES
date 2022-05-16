import XMonad
import XMonad.Util.Run


main :: IO()

main = do
    xmproc <- spawnPipe "xwallpaper --zoom Desktop/w.jpg"
    xmproc <- spawnPipe "setxkbmap gb"
    xmproc <- spawnPipe "picom --experimental-backends"
    xmonad def {
        terminal    = "urxvt",
        borderWidth = 1
    }
