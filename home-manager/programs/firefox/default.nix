{ lib, config, pkgs, ... }: {

  options = {
    firefox_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of firefox with home-manager";
    };
  };

  config = lib.mkIf config.firefox_home-manager.enable {
    home.packages = with pkgs; [
      firefox
    ];
  };
}

