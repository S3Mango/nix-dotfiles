{ lib, config, ... }: {

  options = {
    hyprland_monitors.enable = lib.mkOption {
      default = true;
      description = "Enables monitor config on Hyprland";
    };

    hyprland_monitors.settings = {
      default = [
          "DP-2, 2560x1440@360Hz, 0x0, 1, vrr, 2"
          "DP-1, 2560x1440@144Hz, autoright, 1, vrr, 2"
      ];
      description = "Hyprland monitor setup for a given host";
    };
  };

  config = lib.mkIf config.hyprland_layerrules.enable {
    wayland.windowManager.hyprland = {
      settings = {
        monitor = config.hyprland_monitors.settings;
      };
    };
  };
}
