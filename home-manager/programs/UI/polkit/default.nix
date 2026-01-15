{ lib, config, pkgs, ... }: {

  options = {
    polkit_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Polkit with home-manager";
  };

  config = lib.mkIf config.polkit_home-manager.enable {
    home.packages = with pkgs; [
      polkit
    ];
  };
}
