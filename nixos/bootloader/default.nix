{ lib, config, ... }: {

  options = {
    bootloader_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Systemd Boot with NixOS modules";
    };
  };

  config = lib.mkIf config.bootloader_nixos.enable {
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  };
}
