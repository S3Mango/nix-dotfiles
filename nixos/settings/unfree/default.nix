{ lib, config, ... }: {

  options = {
    unfree_nixos.enable = 
      lib.mkEnableOption "Enables unfree pacakges NixOS modules";
  };

  config = lib.mkIf config.unfree_nixos.enable {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowUnfreePredicate = _: true;
  };

}
