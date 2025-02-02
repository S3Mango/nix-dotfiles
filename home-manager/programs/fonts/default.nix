{ lib, config, inputs, pkgs, ... }: {

  options = {
    fonts_home-manager.enable = lib.mkOption {
      default = true;
      description = "Adds fonts using home-manager";
    };
  };

  config = lib.mkIf config.fonts_home-manager.enable {
    fonts.fontconfig.enable = true;

    home.packages = with pkgs; [
      maple-mono-NF
      cascadia-code
      mononoki
      dejavu_fonts
      material-design-icons
      font-awesome
      corefonts
      noto-fonts-color-emoji
    ];
  };
}

