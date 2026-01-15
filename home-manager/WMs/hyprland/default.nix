{ lib, config, pkgs, inputs, ... }: {

  imports = [
    ../../programs
    ./animations.nix
    ./keybinds.nix
    ./monitors.nix
    ./theme.nix
    ./window-rules.nix
    ./workspaces.nix
    ./v1
    ./v2
    ./v3
  ];

  options = {
    hyprland_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Hyprland on home-manager";
  };

  config = lib.mkIf config.hyprland_home-manager.enable {
    hyprland-v3_home-manager.enable = lib.mkDefault true;

    dunst_home-manager.enable = lib.mkDefault true;
    grim_home-manager.enable = lib.mkDefault true;
    hyprpolkitagent_home-manager.enable = lib.mkDefault true;
    nm-applet_home-manager.enable = lib.mkDefault true;
    pavucontrol_home-manager.enable = lib.mkDefault true;
    polkit_home-manager.enable = lib.mkDefault true;
    rofi_home-manager.enable = lib.mkDefault true;
    slurp_home-manager.enable = lib.mkDefault true;
    swww_home-manager.enable = lib.mkDefault true;
    waybar_home-manager.enable = lib.mkDefault true;
    wireplumber_home-manager.enable = lib.mkDefault true;
    wl-clipboard_home-manager.enable = lib.mkDefault true;
    wlogout_home-manager.enable = lib.mkDefault true;

    home.packages = with pkgs; [
      aquamarine
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;

      plugins = [
        inputs.hyprsplit.packages.${pkgs.stdenv.hostPlatform.system}.hyprsplit
      ];

      settings = {
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
          "SDL_VIDEODRIVER=wayland"
        ];

        exec = [
          "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
          "dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        ];

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          force_default_wallpaper = 0;
        };

        debug = {
          disable_logs = false;
        };

        "xwayland:force_zero_scaling" = true;
      };
    };
  };
}
