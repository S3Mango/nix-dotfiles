{ lib, config, ... }: {

  options = {
    networking_nixos.enable = 
      lib.mkEnableOption "Enables configuration of networking with NixOS modules";
  };

  config = lib.mkIf config.networking_nixos.enable {
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
    };
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
