{...}: {
  users = {
    users.xecarlox = {
      isNormalUser = true;
      description = "xecarlox";
      extraGroups = [ 
        "networkmanager" 
        "wheel" 
        "docker" 
        "libvirt" 
      ];
    };
  };
}
