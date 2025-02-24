{ lib, config, ... }: {

  imports = [
    ./autologin
    ./bootloader
  ];

  options = {
    enableAllBoot_nixos = 
      lib.mkEnableOption "Enables all boot options using NixOS";
  };

  config = 
  let
    bootFlag = config.enableAllBoot_nixos;
  in {
    autologin_nixos.enable = lib.mkIf bootFlag true;
    bootloader_nixos.enable = lib.mkIf bootFlag true;
  };

}
