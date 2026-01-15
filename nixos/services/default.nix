{ lib, config, ... }: {

  imports = [
    ./audio
    ./bluetooth
    ./networking
    ./printing
    ./searxng
    ./tablet
    ./usb
  ];

  options = {
    enableAllServices_nixos = 
      lib.mkEnableOption "Enables all services using NixOS";
  };

  config = 
  let
    servicesFlag = config.enableAllServices_nixos;
  in {
    audio_nixos.enable = lib.mkIf servicesFlag true;
    bluetooth_nixos.enable = lib.mkIf servicesFlag true;
    networking_nixos.enable = lib.mkIf servicesFlag true;
    printing_nixos.enable = lib.mkIf servicesFlag true;
    searxng_nixos.enable = lib.mkIf servicesFlag true;
    tablet_nixos.enable = lib.mkIf servicesFlag true;
    usb_nixos.enable = lib.mkIf servicesFlag true;
  };
}
