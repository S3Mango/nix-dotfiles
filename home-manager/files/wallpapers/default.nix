{ lib, config, ... }: {

  options = {
    wallpapers_home-manager.enable = 
      lib.mkEnableOption "Adds wallpapers with home-manager";
  };

  config = lib.mkIf config.wallpapers_home-manager.enable {
    home.file = {
      "Pictures/Wallpapers" = {
        source = ./wallpapers;
        recursive = true;
      };
    };
  };
}

