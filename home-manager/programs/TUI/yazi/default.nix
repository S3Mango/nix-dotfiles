{ lib, config, ... }: {

  options = {
    yazi_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Yazi with home-manager";
  };

  config =  
  let
    zshFlag = config.zsh_home-manager.enable;
  in lib.mkIf config.yazi_home-manager.enable {
    fd_home-manager.enable = true;
    ffmpeg_home-manager.enable = true;
    fzf_home-manager.enable = true;
    imagemagick_home-manager.enable = true;
    jq_home-manager.enable = true;
    poppler_home-manager.enable = true;
    ripgrep_home-manager.enable = true;
    seven-zip_home-manager.enable = true;

    programs.yazi = {
      enable = true;
      enableZshIntegration = lib.mkIf zshFlag true;
    };

    home.file = {
      ".config/yazi/" = {
        source = ./config_files;
        recursive = true;
      };
    };
  };

}
