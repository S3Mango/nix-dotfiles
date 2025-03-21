{ lib, config, pkgs, ... }: {

  options = {
    lmstudio_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of LM Studio with home-manager";
  };

  config = lib.mkIf config.lmstudio_home-manager.enable {
    home.packages = with pkgs; [
      lmstudio
    ];
  };

}

