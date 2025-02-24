{ lib, ... }: {

  imports = [
    ./fonts
    ./unfree
  ];

  config = {
    fonts_home-manager.enable = lib.mkDefault true;
    unfree_home-manager.enable = lib.mkDefault true;
  };

}
