{ lib, config, pkgs, ... }: {

  options = {
    kdenlive_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of KDEnLive with home-manager";
  };

  config = lib.mkIf config.kdenlive_home-manager.enable {
    home.packages = with pkgs; [
      kdePackages.kdenlive
    ];
  };
}
