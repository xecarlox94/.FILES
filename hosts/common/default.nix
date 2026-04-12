{...}:
#let
  # debug = builtins.trace (builtins.attrNames args) null;
# in
{
  # _debug = debug;

  imports = [
    ./nix.nix
    ./ledger.nix
    ./x11.nix
  ];
}
