{ lib, config, ... }: {

  options = {
    networking_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of networking with NixOS modules";
    };
  };

  config = lib.mkIf config.networking_nixos.enable {
    networking.hostName = "nixos";
    networking.networkmanager.enable = true;
  };
}
