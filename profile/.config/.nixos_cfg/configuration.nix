# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
    imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.loader.efi.efiSysMountPoint = "/boot/efi";

    networking.hostName = "nixos"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/London";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
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

    services.xserver = {

        # Enable the X11 windowing system.
        enable = true;

        displayManager = {
            sddm.enable = true;
            defaultSession = "xfce";
        };

        desktopManager = {
            xterm.enable = false;
            xfce.enable = true;
        };

        windowManager = {
            qtile.enable = true;
            bspwm.enable = true;
            i3.enable = true;
            dwm.enable = true;
            awesome = {
                enable = true;
                luaModules = with pkgs.luaPackages; [
                    luarocks
                    luadbi-mysql
                ];
            };
        };

        # Configure keymap in X11
        layout = "gb";
        xkbVariant = "";
    };


    # Configure console keymap
    console.keyMap = "uk";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        # If you want to use JACK applications, uncomment this
        #jack.enable = true;

        # use the example session manager (no others are packaged yet so this is enabled by default,
        # no need to redefine it in your config for now)
        #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    nixpkgs.config = {
        allowUnfree = true;

        firefox = {
          enableGoogleTalkPlugin = true;
          enableAdobeFlash = true;
        };
    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
        users.users.xecarlox = {
        isNormalUser = true;
        description = "xecarlox";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
            firefox
            thunderbird
        ];
    };

    environment.systemPackages = with pkgs; [
        vim
        wget
        git
        stow
        emacs
        ripgrep
        fd
        clang
        gcc
        coreutils
        unzip
        neovim
        nodePackages.npm
        nodejs
        terraform
        packer
        vault
        consul
        boundary
        nomad
        waypoint
        vagrant
        ledger-live-desktop
        monero-gui
        monero-cli
        keepassxc
        kpcli
        chromium
        gnumake
        guile_3_0
        python310
        python310Packages.python
        python310Packages.pip
        python310Packages.pygame
        python310Packages.coconut
    ];

    virtualisation.docker.enable = true;

    virtualisation.docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true;
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };

    # List services that you want to enable:

    # Enable the OpenSSH daemon.
    # services.openssh.enable = true;

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "22.11"; # Did you read the comment?

}
