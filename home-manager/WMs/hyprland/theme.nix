{ lib, config, ... }: {

  options = {
    hyprland_theme.enable = lib.mkOption {
      default = true;
      description = "Enables theming on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_theme.enable {
    wayland.windowManager.hyprland = {
      settings = {
        general = {
          "gaps_in" = 3;
          "gaps_out" = 8;
          "border_size" = 0;
          layout = "dwindle";
          "resize_on_border" = true;
        };

        decoration = {
          rounding = 10;
          dim_special = 0.3;
          blur = {
            enabled = "yes";
            special = true;
            size = 6;
            passes = 3;
            new_optimizations = "on";
            "ignore_opacity" = "on";
            xray = false;
          };
        };
      };
    };
  };

}
