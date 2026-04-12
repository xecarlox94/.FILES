{...}:
{
  imports = [
    ../../common
    ../../users
    ./hardware-configuration.nix
  ];

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

  # users.groups.libvirtd.members = ["xecarlox"];
  virtualisation.libvirtd.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
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
