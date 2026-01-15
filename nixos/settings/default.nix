{ lib, config, ... }: {

  imports = [
    ./experimental-features
    ./keymap
    ./locale
    ./timezone
    ./unfree
    ./users
  ];

  options = {
    enableAllSettings_nixos = 
      lib.mkEnableOption "Enables all system setting configurations using NixOS";
  };

  config = 
  let
    settingsFlag = config.enableAllSettings_nixos;
  in {
    experimental-features_nixos.enable = lib.mkIf settingsFlag true;
    keymap_nixos.enable = lib.mkIf settingsFlag true;
    locale_nixos.enable = lib.mkIf settingsFlag true;
    timezone_nixos.enable = lib.mkIf settingsFlag true;
    unfree_nixos.enable = lib.mkIf settingsFlag true;
    users_nixos.enable = lib.mkIf settingsFlag true;
  };
}
