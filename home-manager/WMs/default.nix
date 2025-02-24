{ lib, ... }: {

  imports = [
    ./hyprland
  ];

  config = {
    hyprland_home-manager.enable = lib.mkDefault true;
  };

}
