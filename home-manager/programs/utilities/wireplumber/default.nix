{ lib, config, pkgs, ... }: {

  options = {
    wireplumber_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Wireplumber with home-manager";
  };

  config = lib.mkIf config.wireplumber_home-manager.enable {
    home.packages = with pkgs; [
      wireplumber
    ];
  };

}

