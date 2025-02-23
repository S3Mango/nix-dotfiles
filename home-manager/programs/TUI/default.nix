{ lib, config, ... }: {

  imports = [
    ./btop
    ./kitty
    ./neovim
    ./yazi
  ];

  options = {
    enableAllTUI_home-manager = 
      lib.mkEnableOption "Enables all TUI applications using home-manager";
  };

  config = 
  let
    TUIFlag = config.enableAllTUI_home-manager;
  in {
    btop_home-manager.enable = lib.mkIf TUIFlag true;
    kitty_home-manager.enable = lib.mkIf TUIFlag true;
    neovim_home-manager.enable = lib.mkIf TUIFlag true;
    yazi_home-manager.enable = lib.mkIf TUIFlag true;
  };

}
