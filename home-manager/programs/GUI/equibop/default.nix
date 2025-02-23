{ lib, config, pkgs, ... }: {

  options = {
    equibop_home-manager.enable = 
      lib.mkEnableOption true;
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

