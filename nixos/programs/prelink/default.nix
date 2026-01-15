{ lib, config, pkgs, ... }: {

  options = {
    prelink_nixos.enable = 
      lib.mkEnableOption "Enables prelink with NixOS modules";
  };

  config = lib.mkIf config.prelink_nixos.enable {
    environment.systemPackages = with pkgs; [
      prelink
    ];
  };
}

