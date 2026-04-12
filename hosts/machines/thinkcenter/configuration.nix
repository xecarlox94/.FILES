{...}:
{
  imports = [
    ../../common
    ../../users
    ./hardware-configuration.nix
  ];

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

  # audio services
  services = {

    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };


  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };


  # Networking
  networking = {
    hostName = "thinkcenter";
    networkmanager.enable = true;
  };


  # Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };


  system.stateVersion = "25.05";
}
