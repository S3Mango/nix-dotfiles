{ lib, config, inputs, pkgs, ... }: {

  options = {
    scripts_home-manager.enable = lib.mkOption {
      default = true;
      description = "Adds user scripts with home-manager";
    };
  };

  config = lib.mkIf config.scripts_home-manager.enable {
    home.file = {
      "Scripts" = {
        source = ./scripts;
        recursive = true;
      };
    };
  };
}

