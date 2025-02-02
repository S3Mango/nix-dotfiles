{ lib, config, inputs, pkgs, ... }: {

  options = {
    wlogout_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Wlogout with home-manager";
    };
  };

  config = lib.mkIf config.wlogout_home-manager.enable {
    home.packages = with pkgs; [
      wlogout
    ];

    home.file = {
      ".config/wlogout/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}

