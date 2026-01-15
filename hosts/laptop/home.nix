{ lib, inputs, ... }: {

  imports = [
    ../../home-manager
    inputs.stylix.homeManagerModules.stylix
    inputs.nvf.homeManagerModules.default
    inputs.betterfox.homeManagerModules.betterfox
  ];

  config = {
    home.username = "s3mango";
    home.homeDirectory = "/home/s3mango";
    home.stateVersion = "24.11";
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    programs.home-manager.enable = true;
  };
}
