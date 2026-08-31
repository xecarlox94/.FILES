_:
{
  # X11 services
  services = {

    displayManager = {
      ly.enable = true;
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

      xkb = {
        layout = "gb";
        variant = "";
      };
    };
  };

  programs = {
    dconf.enable = true;
  };

}
