{ lib, config, pkgs, ... }: {

  options = {
    seven-zip_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of 7zip with home-manager";
  };

  config = lib.mkIf config.seven-zip_home-manager.enable {
    home.packages = with pkgs; [
      p7zip
    ];
  };
}
