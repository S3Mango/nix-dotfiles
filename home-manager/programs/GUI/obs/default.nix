{ lib, config, pkgs, ... }: {

  options = {
    obs_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of obs lazer with home-manager";
  };

  config = lib.mkIf config.obs_home-manager.enable {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
