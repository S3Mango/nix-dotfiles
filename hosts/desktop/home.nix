{ config, pkgs, inputs, ... }:

{
  imports = [
     ../../home-manager
     inputs.stylix.homeManagerModules.stylix
     inputs.nvf.homeManagerModules.default
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
