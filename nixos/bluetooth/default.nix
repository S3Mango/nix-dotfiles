{ lib, config, pkgs, ... }: {

  options = {
    bluetooth_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Bluetooth with NixOS modules";
    };
  };

  config = lib.mkIf config.bluetooth_nixos.enable {
    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      bluez
      bluez-tools
    ];

    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      package = pkgs.bluez;
      settings.Policy.AutoEnable = "true";
      settings.General = {
          Enable = "Source,Sink,Media,Socket";
          Name = "Hello";
          ControllerMode = "dual";
          FastConnectable = "true";
          Experimental = "true";
          KernelExperimental = "true";
      };
    };
  };

}
