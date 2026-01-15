{ lib, config, pkgs, ... }: {

  options = {
    vlc_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of vlc with home-manager";
  };

  config = lib.mkIf config.vlc_home-manager.enable {
    home.packages = with pkgs; [
      vlc
    ];

  };
}
