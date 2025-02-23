{ lib, config, pkgs, ... }: {

  options = {
    nm-applet_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of nm-applet with home-manager";
  };

  config = lib.mkIf config.nm-applet_home-manager.enable {
    home.packages = with pkgs; [
      networkmanagerapplet
    ];
  };

}

