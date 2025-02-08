{ lib, config, pkgs, ... }: {

  options = {
    users_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables configuation of users with NixOS modules";
    };
  };

  config = lib.mkIf config.users_nixos.enable {
    users.users.s3mango = {
      isNormalUser = true;
      description = "s3mango";
      extraGroups = [ "networkmanager" "wheel" "audio" "video" "input" "lp"];
      shell = pkgs.zsh;
    };
  };
}
