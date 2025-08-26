{ lib, config, pkgs, ... }: {

  options = {
    wine_nixos.enable = 
      lib.mkEnableOption "Enables wine with NixOS modules";
  };

  config = lib.mkIf config.wine_nixos.enable {
    environment.systemPackages = with pkgs; [
      wine
    ];
  };

}
