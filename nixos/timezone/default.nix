{ lib, config, ... }: {

  options = {
    timezone_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of timezone with NixOS modules";
    };
  };

  config = lib.mkIf config.timezone_nixos.enable {
    time.timeZone = "America/New_York";
  };

}
