{ lib, config, pkgs, ... }: {

  options = {
    slurp_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of slurp with home-manager";
  };

  config = lib.mkIf config.slurp_home-manager.enable {
    home.packages = with pkgs; [
      slurp
    ];
  };

}

