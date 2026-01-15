{ lib, config, ... }: {

  imports = [
    ./zsh
  ];

  options = {
    enableAllShells_nixos = 
      lib.mkEnableOption "Enables all shells using NixOS";
  };

  config = 
  let
    shellFlag = config.enableAllShells_nixos;
  in {
    zsh_nixos.enable = lib.mkIf shellFlag true;
  };
}
