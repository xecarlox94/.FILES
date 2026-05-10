{ pkgs, ... }:
{
  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [ 
    pcsc-tools
    opensc
  ];
}
