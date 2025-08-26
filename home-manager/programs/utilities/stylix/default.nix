{ lib, config, pkgs, ... }: {

  options = {
    stylix_home-manager.enable = 
      lib.mkEnableOption "Enables theming with Stylix through home-manager";
  };

  config = lib.mkIf config.stylix_home-manager.enable {
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = {
        base00 = "#1e242e"; # base
        base01 = "#181825"; # mantle
        base02 = "#313244"; # surface0
        base03 = "#45475a"; # surface1
        base04 = "#585b70"; # surface2
        base05 = "#cdd6f4"; # text
        base06 = "#f5e0dc"; # rosewater
        base07 = "#b4befe"; # lavender
        base08 = "#f38ba8"; # red
        base09 = "#fab387"; # peach
        base0A = "#f9e2af"; # yellow
        base0B = "#a6e3a1"; # green
        base0C = "#94e2d5"; # teal
        base0D = "#89b4fa"; # blue
        base0E = "#cba6f7"; # mauve
        base0F = "#f2cdcd"; # flamingo
      };
      image = ./image/coconut.jpg;
      polarity = "dark";

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
        yazi.enable = false;
        starship.enable = false;
        floorp.enable = false;
        firefox.enable = false;
      };
    };
  };

}

