{ lib, config, pkgs, ... }: {

  options = {
    wl-clipboard_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of wl-clipboard with home-manager";
  };

  config = lib.mkIf config.wl-clipboard_home-manager.enable {
    home.packages = with pkgs; [
      wl-clipboard
    ];
  };

}

