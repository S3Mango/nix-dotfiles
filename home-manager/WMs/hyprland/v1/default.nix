{ lib, config, ... }: {

  imports = [
    ./layerrules.nix
  ];

  options = {
    hyprland-v1_home-manager.enable = 
      lib.mkEnableOption "Enables the first version of my Hyprland config on home-manager";
  };

  config = lib.mkIf config.hyprland-v1_home-manager.enable {
    wayland.windowManager.hyprland = {
      settings = {
        exec-once = [
          "systemctl --user start hyprpolkitagent"
          "swww-daemon --no-cache"
          "steam -silent"
          "[workspace special:firefox silent] firefox --new-instance --new-window file://${config.home.homeDirectory}/Scripts/placeholder.html"
          "otd-daemon"
          "udiskie --smart-tray"
          "nm-applet --indicator"
          "dunst"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "$HOME/Scripts/swwwallpaper.sh start &"
          "waybar"
          "blueman-applet"
          "equibop --start-minimized"
        ];
      };
    };
  };
}
