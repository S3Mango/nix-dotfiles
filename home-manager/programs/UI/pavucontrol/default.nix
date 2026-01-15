{ lib, config, pkgs, ... }: {

  options = {
    pavucontrol_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of pavucontrol with home-manager";
  };

  config = lib.mkIf config.pavucontrol_home-manager.enable {
    home.packages = with pkgs; [
      pavucontrol
    ];
  };
}
