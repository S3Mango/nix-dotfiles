{ lib, config, pkgs, ... }: {

  options = {
    onlyoffice_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of onlyoffice with home-manager";
  };

  config = lib.mkIf config.onlyoffice_home-manager.enable {
    home.packages = with pkgs; [
      onlyoffice-documentserver
    ];
  };
}
