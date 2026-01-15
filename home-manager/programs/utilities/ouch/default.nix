{ lib, config, pkgs, ... }: {

  options = {
    ouch_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of ouch with home-manager";
  };

  config = lib.mkIf config.ouch_home-manager.enable {
    home.packages = with pkgs; [
      ouch
    ];
  };
}
