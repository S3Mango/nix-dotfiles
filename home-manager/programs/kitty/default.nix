{ lib, config, ... }: {

  options = {
    kitty_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Kitty with home-manager";
    };
  };

  config = lib.mkIf config.kitty_home-manager.enable {
    programs.kitty = {
      enable = true;
      settings = {
        confirm_os_window_close = 0;
        background_opacity = lib.mkForce "0.6";
        allow_remote_control = true;
        window_padding_width = 25;
        hide_window_decorations = "yes";
	font_size = 16;
      };
    };
  };
}
