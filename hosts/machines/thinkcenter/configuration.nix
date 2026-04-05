{ pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Configure console keymap
  console.keyMap = "uk";

  i18n = rec {
    # Select internationalisation properties.
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

  networking = {
    hostName = "thinkcenter";
    networkmanager.enable = true;
  };

  services = {

    udev.packages = [
      pkgs.ledger-udev-rules
    ];

    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    libinput.enable = true;

    displayManager = {
      gdm.enable = true;
    };

    picom = {
      enable = true;
      backend = "glx";
      settings = {
        blur = {
        method = "dual_kawase";
        strength = 5;
      };

      blur-background-exclude = [
      "window_type = 'dock'"
      "window_type = 'desktop'"
      "_GTK_FRAME_EXTENTS@:c"
      ];
      };
    };

    xserver = {
      # Enable the X11 windowing system.
      enable = true;

      # Cinnammon
      desktopManager = {
        cinnamon.enable = true;
      };

      # Configure keymap in X11
      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xecarlox = {
    isNormalUser = true;
    description = "xecarlox";
    extraGroups = [ "networkmanager" "docker" "wheel" ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05"; # Did you read the comment?

}
