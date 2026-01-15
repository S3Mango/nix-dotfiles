{ lib, config, pkgs, ... }: {

  options = {
    fd_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of fd with home-manager";
  };

  config = lib.mkIf config.fd_home-manager.enable {
    home.packages = with pkgs; [
      fd
    ];
  };
}
