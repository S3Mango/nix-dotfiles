{ lib, config, ... }: {

  options = {
    bluetooth_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Bluetooth with NixOS modules";
    };
  };

  config = lib.mkIf config.bluetooth_nixos.enable {
    hardware.bluetooth.enable = true;
    hardware.bluetooth.powerOnBoot = true;
    services.blueman.enable = true;
  };
}
