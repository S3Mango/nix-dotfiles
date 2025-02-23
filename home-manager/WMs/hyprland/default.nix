{ lib, config, pkgs, inputs, ... }: {

  imports = [
    ../../programs
    ./animations.nix
    ./keybinds.nix
    ./layerrules.nix
    ./monitors.nix
    ./theme.nix
    ./window-rules.nix
    ./workspaces.nix
  ];

  options = {
    hyprland_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Hyprland on home-manager";
  };

  config = lib.mkIf config.hyprland_home-manager.enable {

    dunst_home-manager.enable = true;
    grim_home-manager.enable = true;
    nm-applet_home-manager.enable = true;
    pavucontrol_home-manager.enable = true;
    polkit_home-manager.enable = true;
    rofi_home-manager.enable = true;
    slurp_home-manager.enable = true;
    swww_home-manager.enable = true;
    udiskie_home-manager.enable = true;
    waybar_home-manager.enable = true;
    wireplumber_home-manager.enable = true;
    wl-clipboard_home-manager.enable = true;
    wlogout_home-manager.enable = true;

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      plugins = [
        inputs.hyprsplit.packages.${pkgs.stdenv.hostPlatform.system}.hyprsplit
      ];

      settings = {
        input = {
          kb_options = "caps:super";
      };

      plugin = {
        hyprsplit = {
          num_workspaces = 10;
        };
      };

      env = [
        "XDG_CURRENT_DESKTOP, Hyprland"
        "XDG_SESSION_TYPE, wayland"
        "XDG_SESSION_DESKTOP, Hyprland"
        "QT_QPA_PLATFORM, wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"
        "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
        "MOZ_ENABLE_WAYLAND, 1"
        "GDK_SCALE, 1"
        "GTK_DEBUG=interactive"
      ];

      exec = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      exec-once = [
        "swww-daemon --no-cache"
        "steam -silent"
        "otd-daemon"
        "udiskie --no-automount --smart-tray"
        "nm-applet --indicator"
        "dunst"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "sleep 1.5 && $HOME/Scripts/swwwallpaper.sh &"
        "sleep 3 && waybar"
        "sleep 4 && equibop"
        "sleep 5 && blueman-applet"
      ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      "xwayland:force_zero_scaling" = true;
      };
    };
  };

}
