{ lib, config, pkgs, ... }: {

  options = {
    rofi_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Rofi with home-manager";
  };

  config = lib.mkIf config.rofi_home-manager.enable {
    home.packages = with pkgs; [
      rofi
    ];

    home.file = {
      ".config/rofi/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}
