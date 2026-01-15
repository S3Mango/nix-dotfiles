{ lib, config, pkgs, ... }: {

  options = {
    unzip_nixos.enable = 
      lib.mkEnableOption "Enables unzip with NixOS modules";
  };

  config = lib.mkIf config.unzip_nixos.enable {
    environment.systemPackages = with pkgs; [
      unzip
    ];
  };
}
