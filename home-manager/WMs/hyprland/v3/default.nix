{ lib, config, ... }: {

  imports = [
    ../../../programs
    ./layerrules.nix
  ];

  options = {
    hyprland-v3_home-manager.enable = 
      lib.mkEnableOption "Enables the third version of my Hyprland config on home-manager (using Dank Material Shell)";
  };

  config = lib.mkIf config.hyprland-v3_home-manager.enable {
    dankMaterialShell_home-manager.enable = lib.mkDefault true;

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
          "dms run"
          "equibop --start-minimized"
        ];
      };
    };
  };
}
