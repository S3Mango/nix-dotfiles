{ lib, config, pkgs, ... }: {

  options = {
    udiskie_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of udiskie with home-manager";
  };

  config = lib.mkIf config.udiskie_home-manager.enable {
    home.packages = with pkgs; [
      udiskie
    ];
  };

}

