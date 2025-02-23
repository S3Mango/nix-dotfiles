{ lib, config, pkgs, ... }: {

  options = {
    krita_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Krita with home-manager";
  };

  config = lib.mkIf config.krita_home-manager.enable {
    home.packages = with pkgs; [
      krita
    ];
  };

}

