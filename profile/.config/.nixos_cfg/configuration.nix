# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:
let
    username = "xecarlox";
    hostName = "nixos";
    stateVersion = "22.11";
    locale = "en_GB.UTF-8";
    timeZone = "Europe/London";
in
{

    imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];


    # TO ENABLE!!!!!
    # not supported yet!!!
    nix.settings.use-xdg-base-directories = true;

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 10d";
    };

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = hostName; # Define your hostname.

    networking.networkmanager.enable = true;

    time.timeZone = timeZone;

    i18n.defaultLocale = locale;
    i18n.extraLocaleSettings = {
        LC_ADDRESS = locale;
        LC_IDENTIFICATION = locale;
        LC_MEASUREMENT = locale;
        LC_MONETARY = locale;
        LC_NAME = locale;
        LC_NUMERIC = locale;
        LC_PAPER = locale;
        LC_TELEPHONE = locale;
        LC_TIME = locale;
    };

    services = {
        openssh.enable = true;

        pipewire = {
            enable = true;
            audio.enable = true;
            pulse.enable = true;
            alsa = {
                enable = true;
                support32Bit = true;
            };
            # If you want to use JACK applications, uncomment this
            jack.enable = true;
        };

        xserver = {
            enable = true;

            desktopManager.gnome.enable = true;

            displayManager = {
                lightdm.enable = true;
                defaultSession = "none+xmonad";
            };

            windowManager = {
                xmonad = {
                    enable = true;
                    enableContribAndExtras = true;
                    config = /home/${username}/.config/xmonad/xmonad.hs;
                    enableConfiguredRecompile = true;
                };
            };

            # Configure keymap in X11
            layout = "gb";
            xkbVariant = "";
        };
    };

    virtualisation = {
        docker = {
            enable = true;

            rootless = {
                enable = true;
                setSocketVariable = true;
            };
        };

        libvirtd.enable = true;
    };


    # Configure console keymap
    console.keyMap = "uk";

    # Enable sound with pipewire.
    security.rtkit.enable = true;

    hardware.pulseaudio.enable = false;

    hardware.opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
        setLdLibraryPath = true;
    };


	nixpkgs.config.allowUnfree = true;


    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${username} = {
        isNormalUser = true;
        description = username;
        extraGroups = [ "networkmanager" "wheel" "libvirtd" "audio" ];
    };


    environment.systemPackages = with pkgs; [
        gnumake
        dmenu
        file
        cmake
        libtool
        vim
        tmux
        alacritty
        git
        pavucontrol
        stow
        clang
        coreutils
        unzip
        tree
        gcc
        emacs
        jq
        qutebrowser
        librewolf
        brave
        neovim
        virt-manager
        ghc
        haskell-language-server
    ];

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs = {
        dconf.enable = true;
        mtr.enable = true;
        gnupg.agent = {
            enable = true;
            enableSSHSupport = true;
        };
    };


    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = stateVersion; # Did you read the comment?

}
