{ lib, config, ... }: {

  imports = [
    ./autostart.nix
  ];

  options = {
    hyprland_nixos.enable = 
      lib.mkEnableOption "Enables Hyprland with NixOS modules";
  };

  config = lib.mkIf config.hyprland_nixos.enable {
    programs.hyprland.enable = true;
    autostart_hyprland.enable = lib.mkDefault true;
  };

}
