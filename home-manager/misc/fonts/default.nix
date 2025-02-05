{ lib, config, pkgs, ... }: {

  options = {
    fonts_home-manager.enable = lib.mkOption {
      default = true;
      description = "Adds fonts using home-manager";
    };
  };

  config = lib.mkIf config.fonts_home-manager.enable {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      cascadia-code
      maple-mono-NF
      material-design-icons
      mononoki
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      font-awesome
      fira-code
      corefonts
    ];
  };
}

