{ lib, config, inputs, pkgs, ... }: {

  options = {
    brave_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Brave with home-manager";
    };
  };

  config = lib.mkIf config.brave_home-manager.enable {
    home.packages = with pkgs; [
      brave
    ];
  };
}

