{ lib, config, ... }: {

  options = {
    usb_nixos.enable = 
      lib.mkEnableOption "Enables usb with NixOS modules";
  };

  config = lib.mkIf config.usb_nixos.enable {
    services.udisks2.enable = true;
    services.gvfs.enable = true;
  };
}
