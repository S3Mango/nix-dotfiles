{ lib, config, ... }: {

  options = {
    tablet_nixos.enable = 
      lib.mkEnableOption "Enables tablet support on NixOS";
  };

  config = lib.mkIf config.tablet_nixos.enable {
    hardware.opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };
  };
}
