{ lib, config, ... }: {

  imports = [
    ./autostart.nix
  ];

  options = {
    hyprland_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Hyprland with NixOS modules";
    };
  };

  config = lib.mkIf config.hyprland_nixos.enable {
    programs.hyprland.enable = true;
  };
}
