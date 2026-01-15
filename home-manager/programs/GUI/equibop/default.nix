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
      ".config/equibop/discord.gif" = {
        source = ./config_files/discord.gif;
      };

      ".config/equibop/settings.json".text = ''
        {
          "discordBranch": "canary",
          "disableAutoUpdate": "true",
          "tray": true,
          "minimizeToTray": true,
          "arRPC": true,
          "trayColor": "",
          "trayMainOverride": false,
          "splashColor": "rgb(219, 222, 225)",
          "splashBackground": "rgba(0, 0, 0, 0)",
          "splashTheming": true,
          "enableSplashScreen": true,
          "splashAnimationPath": "/home/${config.home.username}/.config/equibop/discord.gif"
        }
      '';

        ".config/equibop/settings/" = {
          source = ./config_files/settings;
          recursive = true;
        };
    };
  };
}
