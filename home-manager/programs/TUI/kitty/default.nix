{ lib, config, pkgs, ... }: {

  options = {
    kitty_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Kitty with home-manager";
  };

  config = lib.mkIf config.kitty_home-manager.enable {
    home.packages = with pkgs; [
      kitty
    ];

    programs.kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        background_opacity = lib.mkForce "0.6";
        allow_remote_control = false;
        window_padding_width = 25;
        hide_window_decorations = "yes";
        cursor_trail = 1;
        font_size = 16;
      };
    };

    home.file = {
      ".config/kitty/yazi" = {
        source = ./config_files/yazi;
      };
      ".config/kitty/fastfetch" = {
        source = ./config_files/fastfetch;
      };
    };
  };

}
