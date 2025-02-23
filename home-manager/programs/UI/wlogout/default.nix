{ lib, config, pkgs, ... }: {

  options = {
    wlogout_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Wlogout with home-manager";
  };

  config = lib.mkIf config.wlogout_home-manager.enable {
    home.packages = with pkgs; [
      wlogout
    ];
  };

}

