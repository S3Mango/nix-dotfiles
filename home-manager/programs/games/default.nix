{ lib, config, ... }: {

  imports = [
    ./emulators
    ./osulazer
  ];

  options = {
    enableAllGames_home-manager = 
      lib.mkEnableOption "Enables all non-steam games and emulators using home-manager";
  };

  config = 
  let
    gamesFlag = config.enableAllGames_home-manager;
  in {
    enableAllEmulators_home-manager.enable = lib.mkIf gamesFlag true;
    osulazer_home-manager.enable = lib.mkIf gamesFlag true;
  };

}
