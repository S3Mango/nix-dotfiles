{ lib, config, pkgs, ... }: {

  options = {
    socat_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of socat with home-manager";
  };

  config = lib.mkIf config.socat_home-manager.enable {
    home.packages = with pkgs; [
      socat
    ];
  };
}
