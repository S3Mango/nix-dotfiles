{ lib, config, pkgs, ... }: {

  options = {
    python_nixos.enable = 
      lib.mkEnableOption "Enables python with NixOS modules";
  };

  config = lib.mkIf config.python_nixos.enable {
    environment.systemPackages = with pkgs; [
      python313
      python313Packages.pip
      gcc
    ];
  };
}
