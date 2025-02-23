{ lib, config, pkgs, ... }: {

  options = {
    libreoffice_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Libreoffice with home-manager";
  };

  config = lib.mkIf config.libreoffice_home-manager.enable {
    home.packages = with pkgs; [
      libreoffice-still
    ];
  };

}

