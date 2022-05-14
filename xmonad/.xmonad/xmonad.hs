import XMonad
import XMonad.Util.Run

main :: IO()

main = do
    xmproc <- spawnPipe "picom"
    xmonad def {
        terminal    = "urxvt",
        borderWidth = 1
    }
