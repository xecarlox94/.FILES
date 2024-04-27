

#! /usr/bin/env nix-shell
#! nix-shell -p "haskellPackages.ghcWithPackages (p: with p; [turtle])"


echo "Running"

runghc Main.hs
