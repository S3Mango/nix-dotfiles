{ lib, config, ... }: {

  imports = [
    ./cachix
  ];

  options = {
    enableAllBuilding_nixos = 
      lib.mkEnableOption "Enables all building options using NixOS";
  };

  config = 
  let
    buildFlag = config.enableAllBuilding_nixos;
  in {
    cachix_nixos.enable = lib.mkIf buildFlag true;
  };

}
