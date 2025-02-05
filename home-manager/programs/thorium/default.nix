{ lib, config, pkgs, inputs, ... }: {

  options = {
    thorium_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of thorium with home-manager";
    };
  };

  config = lib.mkIf config.thorium_home-manager.enable {
    home.packages = with pkgs; [
      thorium
    ];
  };
}

