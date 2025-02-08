{ lib, config, pkgs, ... }: {

  options = {
    cemu_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Cemu with home-manager";
    };
  };

  config = lib.mkIf config.cemu_home-manager.enable {
    home.packages = with pkgs; [
      cemu
    ];
  };
}

