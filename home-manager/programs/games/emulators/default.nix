{ lib, config, ... }:
let
  emuFlag = config.enableAllGames_home-manager;
in
{
  imports = [
    ./cemu
  ];

  options = {
    enableAllEmulators_home-manager = 
      lib.mkEnableOption "Enables all emulators using home-manager";
  };

  config = 
  {
    cemu_home-manager.enable = lib.mkIf emuFlag true;
  };

}
