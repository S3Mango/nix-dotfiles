{ lib, config, pkgs, ... }: {

  options = {
    udisks_nixos.enable = 
      lib.mkEnableOption "Enables udisks with NixOS modules";
  };

  config = lib.mkIf config.udisks_nixos.enable {
    environment.systemPackages = with pkgs; [
      udisks
    ];
  };
}
