{ lib, config, pkgs, ... }: {

  options = {
    fzf_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of fzf with home-manager";
  };

  config = lib.mkIf config.fzf_home-manager.enable {
    home.packages = with pkgs; [
      fzf
    ];
  };

}

