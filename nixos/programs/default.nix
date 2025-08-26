{ lib, config, ... }: {

  imports = [
    ./efibootmgr
    ./hyprland
    ./nix-prefetch
    ./ollama
    ./steam
    ./tree
    ./udiskie
    ./udisks
    ./unzip
    ./usbutils
    ./wine
  ];

  options = {
    enableAllPrograms_nixos = 
      lib.mkEnableOption "Enables all system-wide programs using NixOS";
  };

  config = 
  let
    programFlag = config.enableAllPrograms_nixos;
  in {
    efibootmgr_nixos.enable = lib.mkIf programFlag true;
    hyprland_nixos.enable = lib.mkIf programFlag true;
    ollama_nixos.enable = lib.mkIf programFlag true;
    nix-prefetch_nixos.enable = lib.mkIf programFlag true;
    steam_nixos.enable = lib.mkIf programFlag true;
    tree_nixos.enable = lib.mkIf programFlag true;
    udiskie_nixos.enable = lib.mkIf programFlag true;
    udisks_nixos.enable = lib.mkIf programFlag true;
    unzip_nixos.enable = lib.mkIf programFlag true;
    usbutils_nixos.enable = lib.mkIf programFlag true;
    wine_nixos.enable = lib.mkIf programFlag true;
  };

}
