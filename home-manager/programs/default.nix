{ lib, ... }: {

  imports = [
    ./games
    ./GUI
    ./shells
    ./TUI
    ./UI
    ./utilities
  ];

  config = {
    enableAllTUI_home-manager = lib.mkDefault true;
    enableAllUtilities_home-manager = lib.mkDefault true;
    firefox_home-manager.enable = lib.mkDefault true;
    zsh_home-manager.enable = lib.mkDefault true;
  };

}
