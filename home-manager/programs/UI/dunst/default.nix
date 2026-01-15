{ lib, config, ... }: {

  options = {
    dunst_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Dunst with home-manager";
  };

  config = lib.mkIf config.dunst_home-manager.enable {
    services.dunst = {
      enable = true;
      settings.global.frame_width = 0;
    };
  };
}
