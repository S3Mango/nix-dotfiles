{ lib, config, ... }: {

  options = {
    bootloader_nixos.enable = 
      lib.mkEnableOption "Enables Bootloading options with NixOS modules";
  };

  config = lib.mkIf config.bootloader_nixos.enable {
    boot = {
      kernelParams = [ "quiet" "loglevel=0" ];
      plymouth.enable = true;
      loader = {
        efi.canTouchEfiVariables = true;
        systemd-boot.enable = false;
        grub = {
          enable = true;
          efiSupport =  true;
          useOSProber = true;
          devices = [
            "nodev"
          ];
        };
      };
    };
  };

}
