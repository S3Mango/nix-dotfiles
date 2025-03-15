{ lib, config, ... }: {

  options = {
    hyprland_animations.enable = lib.mkOption {
      default = true;
      description = "Enable animations on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_animations.enable {
    wayland.windowManager.hyprland = {
      settings = {
        animations = {
          enabled = true;
          bezier = [
            "md3_decel, 0.05, 0.7, 0.1, 1"
          ];

          animation = [ 
            "windowsIn, 1, 4, md3_decel, popin 60%"
            "windowsOut, 1, 4, md3_decel"
            "windowsMove, 1, 4, md3_decel, slide"
            "fade, 1, 5, md3_decel"
            "workspaces, 0"
          ];
        };
      };
    };
  };

}
