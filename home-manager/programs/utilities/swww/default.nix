{ lib, config, pkgs, ... }: {

  options = {
    swww_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of swww with home-manager";
  };

  config = lib.mkIf config.swww_home-manager.enable {
    home.packages = with pkgs; [
      swww
    ];
  };

}

