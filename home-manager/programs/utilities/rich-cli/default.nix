{ lib, config, pkgs, ... }: {

  options = {
    rich-cli_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of rich-cli with home-manager";
  };

  config = lib.mkIf config.rich-cli_home-manager.enable {
    home.packages = with pkgs; [
      rich-cli
    ];
  };

}

