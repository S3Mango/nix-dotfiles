{ lib, config, pkgs, ... }: {

  options = {
    osulazer_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of osu lazer with home-manager";
  };

  config = lib.mkIf config.osulazer_home-manager.enable {
    home.packages = with pkgs; [
      osu-lazer-bin
    ];
  };

}

