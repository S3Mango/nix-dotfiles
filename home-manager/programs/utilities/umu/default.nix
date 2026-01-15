{ lib, config, pkgs, ... }: {

  options = {
    umu_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of umu with home-manager";
  };

  config = lib.mkIf config.umu_home-manager.enable {
    home.packages = with pkgs; [
      umu-launcher
    ];
  };
}
