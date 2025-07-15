# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  ...
}:
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  environment.systemPackages = with pkgs; [
    # pkgs.emacs-git # pkgs.emacsGcc
  ];

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "en_GB.UTF-8";
      LC_IDENTIFICATION = "en_GB.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_GB.UTF-8";
      LC_NAME = "en_GB.UTF-8";
      LC_NUMERIC = "en_GB.UTF-8";
      LC_PAPER = "en_GB.UTF-8";
      LC_TELEPHONE = "en_GB.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [

      # FIX: correct EMACS instalation
      # (import (builtins.fetchTarball { url = "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
      #   sha256 = "sha256:1fpxrkzry23f9rssar1bm8464x0d7w7xmfjxx58gssi3m35xm2zy";
      #
      # }))
    ];
  };

  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = ["qemu:///system"];
  #     uris = ["qemu:///system"];
  #   };
  # };

  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;
  # virtualisation.spiceUSBRedirection.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  networking = {

    hostName = "nixos"; # Define your hostname.
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Enable networking
    networkmanager.enable = true;

  };

  services = {

    udev.packages = [
      pkgs.ledger-udev-rules
    ];


    pulseaudio.enable = false;

    emacs = {
      enable = true;
      package = pkgs.emacs;
    };

    # Enable CUPS to print documents.
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

    };

    libinput.enable = true;

    # Desktop Environment.
    displayManager = {
      gdm.enable = true;
    };

    # Enable the X11 windowing system.
    xserver = {
      enable = true;

      # Cinnammon
      desktopManager = {
        cinnamon.enable = true;
      };


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
  users = {
    users.xecarlox = {
      isNormalUser = true;
      description = "xecarlox";
      extraGroups = [ "networkmanager" "wheel" "docker" "libvirt" ];
    };
    # groups.libvirtd.members = ["xecarlox"];
  };

  system.stateVersion = "24.11"; # Did you read the comment?
}
