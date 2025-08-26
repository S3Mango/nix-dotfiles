{ lib, config, ... }: {

  options = {
    hyprland_window-rules.enable = lib.mkOption {
      default = true;
      description = "Enables window rules on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_window-rules.enable {
    wayland.windowManager.hyprland = {
      settings = {
        windowrulev2 = [ 
          "opacity 0.90 0.90, class:^(floorp)$"
          "opacity 0.90 0.90, class:^(Thorium-browser)$"
          "opacity 0.90 0.90, class:^(kitty)$"
          "opacity 0.90 0.90, class:^(nwg-look)$"
          "opacity 0.90 0.90, class:^(kvantummanager)$"
          "opacity 0.90 0.90, class:^(qt5ct)$"
          "opacity 0.90 0.90, class:^(qt6ct)$"
          "opacity 0.90 0.90, class:^(org.pulseaudio.pavucontrol)$"
          "opacity 0.90 0.90, class:^(.blueman-manager-wrapped)$"
          "opacity 0.90 0.90, class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
          "opacity 0.90 0.90, class:^(rofi)$"
          "opacity 0.90 0.90, class:^(steam)$"
          "opacity 0.90 0.90, class:^(Spotify)$"
          "opacity 0.90 0.90, class:^(com.github.tchx84.Flatseal)$"
          "opacity 0.90 0.90, class:^(com.obsproject.Studio)$"

          "float, class:^(vlc)$"
          "float, class:^(kvantummanager)$"
          "float, class:^(qt5ct)$"
          "float, class:^(qt6ct)$"
          "float, class:^(org.pulseaudio.pavucontrol)$"
          "float, class:^(.blueman-manager-wrapped)$"
          "float, class:^(nm-applet)$"
          "float, class:^(nm-connection-editor)$"

          "fullscreen, class:(steam_app)(.*)"
          "monitor 1, class:(steam_app)(.*)"
          "workspace 20, class:(steam_app)(.*)"

          "noinitialfocus, class:^(equibop)$"
        ];
      };
    };
  };

}
