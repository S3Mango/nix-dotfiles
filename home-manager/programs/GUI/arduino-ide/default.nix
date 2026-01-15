{ lib, config, pkgs, ... }: {

  options = {
    arduino-ide_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Ardunino IDE with home-manager";
  };

  config = lib.mkIf config.arduino-ide_home-manager.enable {
    home.packages = with pkgs; [
      arduino-ide
    ];
  };
}
