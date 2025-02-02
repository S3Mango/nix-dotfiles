{ lib, config, inputs, pkgs, ... }: {

  options = {
    wallpapers_home-manager.enable = lib.mkOption {
      default = true;
      description = "Adds wallpapers with home-manager";
    };
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

