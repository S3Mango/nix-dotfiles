{ lib, config, pkgs, ... }: {

  options = {
    poppler_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of poppler with home-manager";
  };

  config = lib.mkIf config.poppler_home-manager.enable {
    home.packages = with pkgs; [
      poppler
    ];
  };

}

