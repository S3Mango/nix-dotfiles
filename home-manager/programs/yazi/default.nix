{ lib, config, inputs, pkgs, ... }: {

  options = {
    yazi_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Yazi with home-manager";
    };
  };

  config = lib.mkIf config.yazi_home-manager.enable {
    home.packages = with pkgs; [
      yazi
      ffmpeg
      p7zip
      jq
      poppler
      fd
      ripgrep
      fzf
      zoxide
      imagemagick
    ];

    home.file = {
      ".config/yazi/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };
}
