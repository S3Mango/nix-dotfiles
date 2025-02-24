{ lib, config, ... }: {

  options = {
    experimental-features_nixos.enable = 
      lib.mkEnableOption "Enables experimental features with NixOS modules";
  };

  config = lib.mkIf config.experimental-features_nixos.enable {
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
  };

}
