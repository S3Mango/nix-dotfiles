{ lib, config, pkgs, ... }: {

  options = {
    swaylock_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Swaylock with home-manager";
  };

  config = lib.mkIf config.swaylock_home-manager.enable {
    home.packages = with pkgs; [
      swaylock-effects
    ];

    home.file = {
      ".config/swaylock/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}
