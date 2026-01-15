{ lib, config, ... }: {

  imports = [
    ../../../programs
    ./layerrules.nix
  ];

  options = {
    hyprland-v2_home-manager.enable = 
      lib.mkEnableOption "Enables the second version of my Hyprland config on home-manager (using Noctalia)";
  };

  config = lib.mkIf config.hyprland-v2_home-manager.enable {
    noctalia_home-manager.enable = lib.mkDefault true;

    wayland.windowManager.hyprland = {
      settings = {
        exec-once = [
          "systemctl --user start hyprpolkitagent"
          "steam -silent"
          "swww-daemon --no-cache"
          "[workspace special:firefox silent] firefox --new-instance --new-window file://${config.home.homeDirectory}/Scripts/placeholder.html"
          "otd-daemon"
          "udiskie --smart-tray"
          "wl-paste --type text --watch cliphist store"
          "wl-paste --type image --watch cliphist store"
          "$HOME/Scripts/swwwallpaper.sh start &"
          "noctalia-shell"
          "equibop --start-minimized"
        ];
      };
    };
  };
}
