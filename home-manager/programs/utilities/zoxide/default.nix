{ lib, config, pkgs, ... }: {

  options = {
    zoxide_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Zoxide with home-manager";
  };

  config =
  let
    zshFlag = config.zsh_home-manager.enable;
  in lib.mkIf config.zoxide_home-manager.enable {
    home.packages = with pkgs; [
      zoxide
    ];

    programs.zoxide = {
      enable = true;
      enableZshIntegration = lib.mkIf zshFlag true;
    };
  };

}

