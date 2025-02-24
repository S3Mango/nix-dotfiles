{ lib, config, ... }: {

  options = {
    udisk2_nixos.enable = 
      lib.mkEnableOption "Enables udiskie with NixOS modules";
  };

  config = lib.mkIf config.udisk2_nixos.enable {
    services.udisks2.enable = true;
  };

}
