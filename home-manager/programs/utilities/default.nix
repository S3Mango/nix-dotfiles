{ lib, config, ... }: {
  imports = [
    ./7zip
    ./fastfetch
    ./fd
    ./ffmpeg
    ./fzf
    ./grim
    ./imagemagick
    ./jq
    ./poppler
    ./ripgrep
    ./slurp
    ./starship
    ./stylix
    ./swww
    ./udiskie
    ./wireplumber
    ./wl-clipboard
    ./zoxide
  ];

  options = {
    enableAllUtilities_home-manager = 
      lib.mkEnableOption "Enables all utilities using home-manager";
  };

  config = 
  let
    utilsFlag = config.enableAllUtilities_home-manager;
  in {
    fastfetch_home-manager.enable = lib.mkIf utilsFlag true;
    fd_home-manager.enable = lib.mkIf utilsFlag true;
    ffmpeg_home-manager.enable = lib.mkIf utilsFlag true;
    fzf_home-manager.enable = lib.mkIf utilsFlag true;
    grim_home-manager.enable = lib.mkIf utilsFlag true;
    imagemagick_home-manager.enable = lib.mkIf utilsFlag true;
    jq_home-manager.enable = lib.mkIf utilsFlag true;
    poppler_home-manager.enable = lib.mkIf utilsFlag true;
    ripgrep_home-manager.enable = lib.mkIf utilsFlag true;
    seven-zip_home-manager.enable = lib.mkIf utilsFlag true;
    slurp_home-manager.enable = lib.mkIf utilsFlag true;
    starship_home-manager.enable = lib.mkIf utilsFlag true;
    stylix_home-manager.enable = lib.mkIf utilsFlag true;
    swww_home-manager.enable = lib.mkIf utilsFlag true;
    udiskie_home-manager.enable = lib.mkIf utilsFlag true;
    wireplumber_home-manager.enable = lib.mkIf utilsFlag true;
    wl-clipboard_home-manager.enable = lib.mkIf utilsFlag true;
    zoxide_home-manager.enable = lib.mkIf utilsFlag true;
  };

}
