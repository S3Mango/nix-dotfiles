{ lib, config, ... }: {

  options = {
    printing_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables printing services with NixOS modules";
    };
  };

  config = lib.mkIf config.printing_nixos.enable {
    services.printing.enable = true;
    hardware.sane.enable = true;
  };

}
