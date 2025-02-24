{ lib, ... }: {

  imports = [
    ./scripts
    ./wallpapers
  ];

  config = {
    scripts_home-manager.enable = lib.mkDefault true;
    wallpapers_home-manager.enable = lib.mkDefault true;
  };

}
