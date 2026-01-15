{ lib, config, pkgs, ... }: {

  options = {
    floorp_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Floorp with home-manager";
  };

  config = lib.mkIf config.floorp_home-manager.enable {
    home.packages = with pkgs; [
      floorp
    ];

    programs.floorp = {
      enable = true;
      profiles."${config.home.username}" = {
        isDefault = true;
      };
    };

    home.file = {
      ".floorp/${config.home.username}/user.js" = {
        source = ./config_files/user.js;
      };

      ".floorp/${config.home.username}/chrome/" = {
        source = ./config_files/chrome;
        recursive = true;
      };

    };
  };
}
