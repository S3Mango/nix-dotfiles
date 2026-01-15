{ lib, config, pkgs, ... }: {

  options = {
    brave_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Brave with home-manager";
  };

  config = lib.mkIf config.brave_home-manager.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
}
