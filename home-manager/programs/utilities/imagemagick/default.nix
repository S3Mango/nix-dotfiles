{ lib, config, pkgs, ... }: {

  options = {
    imagemagick_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of imagemagick with home-manager";
  };

  config = lib.mkIf config.imagemagick_home-manager.enable {
    home.packages = with pkgs; [
      imagemagick
    ];
  };

}

