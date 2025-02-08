{ lib, config, pkgs, ... }: {

  options = {
    rofi_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Rofi with home-manager";
    };
  };

  config = lib.mkIf config.rofi_home-manager.enable {
    home.packages = with pkgs; [
      rofi-wayland
    ];

    home.file = {
      ".config/rofi/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}

