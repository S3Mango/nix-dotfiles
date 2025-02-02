{ lib, config, inputs, pkgs, ... }: {

  options = {
    dunst_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Dunst with home-manager";
    };
  };

  config = lib.mkIf config.dunst_home-manager.enable {
    home.packages = with pkgs; [
      dunst
    ];
  };
}

