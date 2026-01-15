{ lib, config, pkgs, ... }: {

  options = {
    udiskie_nixos.enable = 
      lib.mkEnableOption "Enables udiskie with NixOS modules";
  };

  config = lib.mkIf config.udiskie_nixos.enable {
    environment.systemPackages = with pkgs; [
      udiskie
    ];
  };
}
