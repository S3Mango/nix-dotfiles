{ lib, config, pkgs, ... }: {

  options = {
    waybar_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Waybar with home-manager";
    };
  };

  config = lib.mkIf config.waybar_home-manager.enable {
    home.packages = with pkgs; [
      waybar
    ];

    home.file = {
      ".config/waybar/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}

