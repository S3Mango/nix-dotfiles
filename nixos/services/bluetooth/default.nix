{ lib, config, pkgs, ... }: {

  options = {
    bluetooth_nixos.enable = 
      lib.mkEnableOption "Enables Bluetooth with NixOS modules";
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

    systemd.services.unblock-bluetooth = {
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${pkgs.util-linux}/bin/rfkill unblock bluetooth";
      };
    };
  };
}

