{ lib, config, ... }: {
  imports = [
    ./7zip
    ./fastfetch
    ./fd
    ./ffmpeg
    ./fzf
    ./grim
    ./hyprpolkitagent
    ./imagemagick
    ./jq
    ./opencode
    ./ouch
    ./poppler
    ./ripgrep
    ./rustup
    ./socat
    ./slurp
    ./starship
    ./stylix
    ./swww
    ./umu
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
    hyprpolkitagent_home-manager.enable = lib.mkIf utilsFlag true;
    imagemagick_home-manager.enable = lib.mkIf utilsFlag true;
    jq_home-manager.enable = lib.mkIf utilsFlag true;
    opencode_home-manager.enable = lib.mkIf utilsFlag true;
    ouch_home-manager.enable = lib.mkIf utilsFlag true;
    poppler_home-manager.enable = lib.mkIf utilsFlag true;
    ripgrep_home-manager.enable = lib.mkIf utilsFlag true;
    rustup_home-manager.enable = lib.mkIf utilsFlag true;
    seven-zip_home-manager.enable = lib.mkIf utilsFlag true;
    socat_home-manager.enable = lib.mkIf utilsFlag true;
    slurp_home-manager.enable = lib.mkIf utilsFlag true;
    starship_home-manager.enable = lib.mkIf utilsFlag true;
    stylix_home-manager.enable = lib.mkIf utilsFlag true;
    swww_home-manager.enable = lib.mkIf utilsFlag true;
    umu_home-manager.enable = lib.mkIf utilsFlag true;
    wireplumber_home-manager.enable = lib.mkIf utilsFlag true;
    wl-clipboard_home-manager.enable = lib.mkIf utilsFlag true;
    zoxide_home-manager.enable = lib.mkIf utilsFlag true;
  };
}
