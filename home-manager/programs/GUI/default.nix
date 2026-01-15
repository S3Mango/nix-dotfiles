{ lib, config, ... }: {

  imports = [
    ./arduino-ide
    # ./brave
    ./equibop
    ./firefox
    # ./floorp
    ./kdenlive
    ./krita
    ./librechat
    ./libreoffice
    # ./livesplit
    ./lmstudio
    ./obs
    # ./onlyoffice
    ./spotify
    # ./vesktop
    ./vlc
  ];

  options = {
    enableAllGUI_home-manager = 
      lib.mkEnableOption "Enables all GUI applications using home-manager";
    disableAllGUI_home-manager = 
      lib.mkEnableOption "Disables all GUI applications using home-manager";
  };

  config = 
  let
    EnableFlag = config.enableAllGUI_home-manager;
    DisableFlag = config.disableAllGUI_home-manager;
  in {
    arduino-ide_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    # brave_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    equibop_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    # floorp_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    firefox_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    kdenlive_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    krita_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    librechat_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    libreoffice_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    # livesplit_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    lmstudio_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false); 
    obs_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false); 
    # onlyoffice_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false); 
    spotify_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    # vesktop_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
    vlc_home-manager.enable = if EnableFlag then true else (lib.mkIf DisableFlag false);
  };
}
