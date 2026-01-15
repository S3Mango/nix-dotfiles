{ lib, config, ... }: {

  options = {
    hyprland_layerrules-v2.enable = lib.mkOption {
      default = true;
      description = "Enables Layer rules on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_layerrules-v2.enable {
    wayland.windowManager.hyprland = {
      settings = {
        layerrule = [
          "blur, rofi"
          "ignorezero, rofi"
          "blur, notifications"
          "ignorezero, notifications"
          "blur, logout_dialog"
          "blur, ^.*(?i:noctalia-bar-content).*$ "
        ];
      };
    };
  };
}
