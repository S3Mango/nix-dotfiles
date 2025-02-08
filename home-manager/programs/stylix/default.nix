{ lib, config, pkgs, ... }: {

  options = {
    stylix_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables theming with Stylix through home-manager";
    };
  };

  config = lib.mkIf config.stylix_home-manager.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      image = ./image/placeholder.jpg;

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Classic";
        size = 30;
      };

      fonts = {
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrains Mono Nerd Font Mono";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        serif = {
          package = pkgs.noto-fonts;
          name = "Noto Serif";
        };

        sizes = {
          applications = 11;
          desktop = 11;
          popups = 11;
        };
      };

      targets = {
        hyprland.enable = false;
      };
    };
  };
}

