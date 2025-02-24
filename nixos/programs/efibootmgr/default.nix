{ lib, config, pkgs, ... }: {

  options = {
    efibootmgr_nixos.enable = 
      lib.mkEnableOption "Enables efibootmgr with NixOS modules";
  };

  config = lib.mkIf config.steam_nixos.enable {
    environment.systemPackages = with pkgs; [
      efibootmgr
    ];
  };

}
