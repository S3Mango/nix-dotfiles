{ lib, config, pkgs, ... }: {

  options = {
    grim_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Grim with home-manager";
  };

  config = lib.mkIf config.grim_home-manager.enable {
    home.packages = with pkgs; [
      grim
    ];
  };

}

