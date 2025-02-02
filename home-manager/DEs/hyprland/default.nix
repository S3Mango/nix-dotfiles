{ lib, config, pkgs, inputs, ... }: {

  imports = [
    ../../programs
    ./animations.nix
    ./keybinds.nix
    ./layerrules.nix
    # ./monitors.nix
    ./theme.nix
    ./window-rules.nix
    ./workspaces.nix
  ];

  options = {
    hyprland_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Hyprland on home-manager";
    };
  };

  config = lib.mkIf config.hyprland_home-manager.enable {
    home.packages = with pkgs; [
      wireplumber
      polkit
      swww
      wl-clipboard
      networkmanagerapplet
      udiskie
    ];

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
      ];

      exec = [
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      exec-once = [
        "swww-daemon --no-cache"
        "steam -silent"
        "otd-daemon"
        "waybar"
        "blueman-applet"
        "udiskie --no-automount --smart-tray"
        "nm-applet --indicator"
        "dunst"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "$HOME/Scripts/swwwallpaper.sh &"
      ];

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      "xwayland:force_zero_scaling" = true;
      };
    };
  };
}
