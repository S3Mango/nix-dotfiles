{ lib, config, pkgs, ... }: {

  options = {
    usbutils_nixos.enable = 
      lib.mkEnableOption "Enables usbutils with NixOS modules";
  };

  config = lib.mkIf config.usbutils_nixos.enable {
    environment.systemPackages = with pkgs; [
      usbutils
    ];
  };

}
