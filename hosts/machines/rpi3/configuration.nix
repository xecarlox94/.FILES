{ hostName, pkgs, ... }:
{
  imports = [
    ../../users
  ];

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
  ];

  networking = {
    inherit hostName;
    networkmanager.enable = true;
  };

  nixpkgs.config.allowUnfree = true;

  # Enable SSH
  services.openssh.enable = true;

  users.users.xecarlox.password = "pi";

  # nixpkgs.config.allowUnfree = true;

  time.timeZone = "Europe/London";
  console.keyMap = "uk";
  i18n = rec {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = defaultLocale;
      LC_IDENTIFICATION = defaultLocale;
      LC_MEASUREMENT = defaultLocale;
      LC_MONETARY = defaultLocale;
      LC_NAME = defaultLocale;
      LC_NUMERIC = defaultLocale;
      LC_PAPER = defaultLocale;
      LC_TELEPHONE = defaultLocale;
      LC_TIME = defaultLocale;
    };
  };

  system.stateVersion = "26.11";
}
