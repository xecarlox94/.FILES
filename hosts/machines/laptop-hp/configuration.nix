{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.gc = {
    automatic = true;
    options = "--delete-older-than 7d";
  };

  console.keyMap = "uk";

  time.timeZone = "Europe/London";

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

  nixpkgs.config.allowUnfree = true;

  # dconf.settings = {
  #   "org/virt-manager/virt-manager/connections" = {
  #     autoconnect = ["qemu:///system"];
  #     uris = ["qemu:///system"];
  #   };
  # };

  programs.virt-manager.enable = true;

  virtualisation.libvirtd.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  networking = {

    hostName = "nixos";
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    networkmanager.enable = true;
  };

  services = {

    udev.packages = [
      pkgs.ledger-udev-rules
    ];


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

    picom.enable = true;
    picom.backend = "glx";

    xserver = {
      enable = true;
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
