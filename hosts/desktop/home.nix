{ config, pkgs, inputs, ... }:

{
  imports = [
     ../../home-manager
     inputs.flatpaks.homeManagerModules.nix-flatpak
     inputs.nixvim.homeManagerModules.nixvim
     inputs.stylix.homeManagerModules.stylix
  ];
  home.username = "s3mango";
  home.homeDirectory = "/home/s3mango";
  home.stateVersion = "24.11";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
