{ lib, ... }: {

  imports = [
    ./boot
    ./building
    ./programs
    ./services
    ./settings
    ./shells
  ];

  config = {
    enableAllBoot_nixos = lib.mkDefault true;
    enableAllBuilding_nixos = lib.mkDefault true;
    enableAllServices_nixos = lib.mkDefault true;
    enableAllSettings_nixos = lib.mkDefault true;
    hyprland_nixos.enable = lib.mkDefault true;
    zsh_nixos.enable = lib.mkDefault true;
  };
}
