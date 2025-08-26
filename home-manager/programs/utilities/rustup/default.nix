{ lib, config, pkgs, ... }: {

  options = {
    rustup_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of rustup with home-manager";
  };

  config = lib.mkIf config.rustup_home-manager.enable {
    home.packages = with pkgs; [
      rustup
    ];
  };

}

