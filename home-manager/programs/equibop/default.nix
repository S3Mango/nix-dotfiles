{ lib, config, pkgs, ... }: {

  options = {
    equibop_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Equibop with home-manager";
    };
  };

  config = lib.mkIf config.equibop_home-manager.enable {
    home.packages = with pkgs; [
      equibop
    ];

    home.file = {
      ".config/equibop/settings/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}

