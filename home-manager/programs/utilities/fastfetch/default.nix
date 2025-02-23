{ lib, config, pkgs, ... }: {

  options = {
    fastfetch_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of fastfetch with home-manager";
  };

  config = lib.mkIf config.fastfetch_home-manager.enable {
    home.packages = with pkgs; [
     fastfetch 
    ];
  };

}

