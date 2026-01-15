{ lib, config, ... }: {

  options = {
    dankMaterialShell_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Dank Material Shell with home-manager";
  };

  config = lib.mkIf config.dankMaterialShell_home-manager.enable {
    programs.dankMaterialShell = {
      enable = true;
    };
  };
}
