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

      ".floorp/${config.home.username}/extensions.json" = {
        source = ./config_files/extensions.json;
        force = true;
      };

      ".floorp/${config.home.username}/extension-settings.json" = {
        source = ./config_files/extension-settings.json;
        force = true;
      };

      ".floorp/${config.home.username}/extension-preferences.json" = {
        source = ./config_files/extension-preferences.json;
        force = true;
      };

      ".floorp/${config.home.username}/chrome/" = {
        source = ./config_files/chrome;
        recursive = true;
      };

      ".floorp/${config.home.username}/extensions/" = {
        source = ./config_files/extensions;
        recursive = true;
      };
    };
  };

}
