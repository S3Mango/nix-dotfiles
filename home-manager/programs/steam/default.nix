{ lib, config, inputs, pkgs, ... }: {

  options = {
    steam_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Steam with home-manager";
    };
  };

  config = lib.mkIf config.steam_home-manager.enable {
    home.packages = with pkgs; [
      steam
    ];
  };
}

