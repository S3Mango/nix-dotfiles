{ lib, config, pkgs, ... }: {

  options = {
    tree_nixos.enable = 
      lib.mkEnableOption "Enables tree with NixOS modules";
  };

  config = lib.mkIf config.tree_nixos.enable {
    environment.systemPackages = with pkgs; [
      tree
    ];
  };

}
