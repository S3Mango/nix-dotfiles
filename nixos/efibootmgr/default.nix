{ lib, config, pkgs, ... }: {

  options = {
    efibootmgr_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables efibootmgr with NixOS modules";
    };
  };

  config = lib.mkIf config.steam_nixos.enable {
    environment.systemPackages = with pkgs; [
      efibootmgr
    ];
  };

}
