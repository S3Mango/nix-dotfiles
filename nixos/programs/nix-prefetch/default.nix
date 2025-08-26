{ lib, config, pkgs, ... }: {

  options = {
    nix-prefetch_nixos.enable = 
      lib.mkEnableOption "Enables nix-prefetch with NixOS modules";
  };

  config = lib.mkIf config.nix-prefetch_nixos.enable {
    environment.systemPackages = with pkgs; [
      nix-prefetch
    ];
  };

}
