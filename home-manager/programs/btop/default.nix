{ lib, config, pkgs, ... }: {

  options = {
    btop_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of btop with home-manager";
    };
  };

  config = lib.mkIf config.btop_home-manager.enable {
    home.packages = with pkgs; [
      btop
    ];
  };
}

