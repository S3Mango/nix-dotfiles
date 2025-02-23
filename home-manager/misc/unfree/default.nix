{ lib, config, ... }: {

  options = {
    unfree_home-manager.enable = lib.mkOption {
      default = true;
      description = "Allows unfree packages with home-manager";
    };
  };

  config = lib.mkIf config.unfree_home-manager.enable {
    nixpkgs.config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

}
