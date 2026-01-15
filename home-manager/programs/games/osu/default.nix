{ lib, config, inputs, pkgs, ... }: {

  options = {
    osu_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of osu with home-manager";
  };

  config = lib.mkIf config.osu_home-manager.enable {
    home.packages = with inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}; [
      osu-stable
    ];
  };
}
