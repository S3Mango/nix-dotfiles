{ lib, config, pkgs, ... }: {

  options = {
    firefox_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of firefox with home-manager";
  };

  config = lib.mkIf config.firefox_home-manager.enable {
    home.packages = with pkgs; [
      firefox
    ];

    programs.firefox = {
      enable = true;
      betterfox.enable = true;

      profiles.${config.home.username} = {

        settings = {
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        betterfox = {
          enable = true;
          enableAllSections = true;
          securefox.tracking-protection = {
            "browser.download.start_downloads_in_tmp_dir".value = false;
          };
        };
      };
    };
  };

}
