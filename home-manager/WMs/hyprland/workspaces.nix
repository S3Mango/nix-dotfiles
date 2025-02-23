{ lib, config, ... }: {

  options = {
    hyprland_workspaces.enable = lib.mkOption {
      default = true;
      description = "Enables workspaces on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_workspaces.enable {
    wayland.windowManager.hyprland = {
      settings = {
        workspace = [
          "10, border:false, rounding:false"
        ];
      };
    };
  };

}
