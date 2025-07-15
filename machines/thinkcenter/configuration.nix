# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let

  # setup_cmd = xrandr_cmd: ''
  #   ${xrandr_cmd} \
  #     --output DP-1 --off --output HDMI-1 --off \
  #     --output DP-2 --off --output HDMI-2 --mode 1920x1080 --pos 1200x0 --rotate normal \
  #     --output DP-3 --off --output HDMI-3 --mode 1920x1200 --pos 0x0 --rotate right
  #   '';
  #
  # setup_displays = pkgs.writeShellScriptBin "thinkcenter_set_displays" (setup_cmd "xrandr");
in
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

  i18n ={
    # Select internationalisation properties.
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

  networking = {
    hostName = "thinkcenter"; # Define your hostname.

    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
  };

  services = {

    # Enable the OpenSSH daemon.
    # openssh.enable = true;

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
      # If you want to use JACK applications, uncomment this
      # jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    libinput.enable = true;

    # Desktop Environment.
    displayManager = {
      gdm.enable = true;

      # FIX: xrandr setup
      # setupCommands = setup_cmd pkgs.xorg.xrandr;
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

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
  ];


  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  system.stateVersion = "25.05"; # Did you read the comment?

}
