{
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../common
    ../../users
  ];

  # users = {
  # users.xecarlox = {
  # isNormalUser = true;
  # description = "xecarlox";
  # extraGroups = [ 
  # "networkmanager" 
  # "wheel" 
  # "docker" 
  # "libvirt" 
  # ];
  # };
  # };

  # users.groups.libvirtd.members = ["xecarlox"];


  console.keyMap = "uk";

  time.timeZone = "Europe/London";

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

  # nixpkgs.config.allowUnfree = true;

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

  # nano ledger device
  services.udev.packages = with pkgs; [
    ledger-udev-rules
  ];

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


  # X11 services
  services = {

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


  # Security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };


  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };


  # Boot
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };


  system.stateVersion = "24.11";
}
