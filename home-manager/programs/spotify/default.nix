{ lib, config, pkgs, ... }: {

  options = {
    spotify_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Spotify with home-manager";
    };
  };

  config = lib.mkIf config.spotify_home-manager.enable {
    home.packages = with pkgs; [
      spotify
    ];
  };
}

