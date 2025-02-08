{ lib, config, ... }: {

  options = {
    cachix_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Cachix for Hyprland with NixOS modules";
    };
  };

  config = lib.mkIf config.cachix_nixos.enable {
    nix.settings = {
      substituters = ["https://hyprland.cachix.org"];
      trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    };
  };
}
