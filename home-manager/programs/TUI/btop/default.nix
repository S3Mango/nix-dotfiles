{ lib, config, pkgs, ... }: {

  options = {
    btop_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of btop with home-manager";
  };

  config = lib.mkIf config.btop_home-manager.enable {
    home.packages = with pkgs; [
      btop
    ];
  };

}

