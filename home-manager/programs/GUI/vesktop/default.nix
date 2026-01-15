{ lib, config, pkgs, ... }: {

  options = {
    vesktop_home-manager.enable = 
      lib.mkEnableOption true;
  };

  config = lib.mkIf config.vesktop_home-manager.enable {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
