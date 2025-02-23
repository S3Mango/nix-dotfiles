{ lib, inputs, ... }: {

  imports = [
    ../../home-manager
    inputs.stylix.homeManagerModules.stylix
    inputs.nvf.homeManagerModules.default
  ];

  config = {
    home.username = "s3mango";
    home.homeDirectory = "/home/s3mango";
    home.stateVersion = "24.11";
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    enableAllGames_home-manager = lib.mkForce true;
    enableAllGUI_home-manager = lib.mkForce true;

    programs.home-manager.enable = true;
  };

}
