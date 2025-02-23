{ lib, config, pkgs, ... }: {

  options = {
    ffmpeg_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of ffmepg with home-manager";
  };

  config = lib.mkIf config.ffmpeg_home-manager.enable {
    home.packages = with pkgs; [
      ffmpeg
    ];
  };

}

