{ lib, config, ... }: {

  options = {
    autologin_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables automatic login for the user with NixOS modules";
    };
  };

  config = lib.mkIf config.autologin_nixos.enable {
    services.getty.autologinUser = "s3mango";
  };

}

