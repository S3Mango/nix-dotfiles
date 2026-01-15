{ lib, config, ... }: {

  options = {
    cachix_nixos.enable = 
      lib.mkEnableOption "Enables Cachix with NixOS modules";
  };

  config = lib.mkIf config.cachix_nixos.enable {
    nix.settings = {
      substituters = [
        "https://hyprland.cachix.org"
        "https://nix-gaming.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      ];
    };
  };
}
