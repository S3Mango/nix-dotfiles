{ lib, config, ... }: {

  options = {
    starship_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Starship with home-manager";
  };

  config = lib.mkIf config.starship_home-manager.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };

    home.file = {
      ".config/starship.toml" = {
        source = ./config_files/starship.toml;
      };
    };
  };

}

