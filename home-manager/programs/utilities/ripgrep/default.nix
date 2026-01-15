{ lib, config, pkgs, ... }: {

  options = {
    ripgrep_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of ripgrep with home-manager";
  };

  config = lib.mkIf config.ripgrep_home-manager.enable {
    home.packages = with pkgs; [
      ripgrep
    ];
  };
}
