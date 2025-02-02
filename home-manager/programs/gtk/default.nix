{ lib, config, inputs, pkgs, ... }: {

  options = {
    gtk_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of GTK with home-manager";
    };
  };

  config = lib.mkIf config.gtk_home-manager.enable {
    gtk = {
      enable = true;

      theme = {
        package = pkgs.catppuccin-gtk;
        name = "catppuccin-mocha-lavender-standard+default";
      };

      iconTheme = {
        package = pkgs.dracula-icon-theme;
        name = "Tela-circle-dracula";
      };

      cursorTheme = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Classic";
        size = 20;
      };

      font = {
        package = pkgs.cantarell-fonts;
        name = "Cantrell";
        size = 10;
      };

      gtk3.extraConfig = {
        gtk-toolbar-style = "GTK_TOOLBAR_ICONS";
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-button-images = 0;
        gtk-menu-images = 0;
        gtk-enable-event-sounds = 1;
        gtk-enable-input-feedback-sounds = 0;
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintfull";
        gtk-xft-rgba = "rgb";
        gtk-application-prefer-dark-theme = 1;
      };
    };
  };
}

