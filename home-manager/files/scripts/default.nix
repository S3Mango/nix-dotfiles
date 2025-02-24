{ lib, config, ... }: {

  options = {
    scripts_home-manager.enable = 
      lib.mkEnableOption "Adds user scripts with home-manager";
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

