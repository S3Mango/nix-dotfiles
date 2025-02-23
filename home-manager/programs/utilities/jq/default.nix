{ lib, config, pkgs, ... }: {

  options = {
    jq_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of jq with home-manager";
  };

  config = lib.mkIf config.jq_home-manager.enable {
    home.packages = with pkgs; [
      jq
    ];
  };

}

