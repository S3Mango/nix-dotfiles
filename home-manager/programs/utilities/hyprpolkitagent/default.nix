{ lib, config, pkgs, ... }: {

  options = {
    hyprpolkitagent_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of hyprpolkitagent with home-manager";
  };

  config = lib.mkIf config.hyprpolkitagent_home-manager.enable {
    home.packages = with pkgs; [
      hyprpolkitagent
    ];
  };
}
