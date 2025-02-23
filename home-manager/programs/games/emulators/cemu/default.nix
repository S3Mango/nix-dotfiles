{ lib, config, pkgs, ... }: {

  options = {
    cemu_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Cemu with home-manager";
  };

  config = lib.mkIf config.cemu_home-manager.enable {
    home.packages = with pkgs; [
      cemu
    ];
  };

}

