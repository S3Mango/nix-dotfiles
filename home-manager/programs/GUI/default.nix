{ lib, config, ... }: {

  imports = [
    ./brave
    ./equibop
    ./floorp
    ./krita
    ./libreoffice
    ./lmstudio
    ./obs
    ./spotify
  ];

  options = {
    enableAllGUI_home-manager = 
      lib.mkEnableOption "Enables all GUI applications using home-manager";
  };

  config = 
  let
    GUIFlag = config.enableAllGUI_home-manager;
  in {
    brave_home-manager.enable = lib.mkIf GUIFlag true;
    equibop_home-manager.enable = lib.mkIf GUIFlag true;
    floorp_home-manager.enable = lib.mkIf GUIFlag true;
    krita_home-manager.enable = lib.mkIf GUIFlag true;
    libreoffice_home-manager.enable = lib.mkIf GUIFlag true;
    lmstudio_home-manager.enable = lib.mkIf GUIFlag true;
    obs_home-manager.enable = lib.mkIf GUIFlag true;
    spotify_home-manager.enable = lib.mkIf GUIFlag true;
  };

}
