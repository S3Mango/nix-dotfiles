{ lib, config, pkgs, ... }: {

  options = {
    printing_nixos.enable = 
      lib.mkEnableOption "Enables printing services with NixOS modules";
  };

  config = lib.mkIf config.printing_nixos.enable {
    services.printing = {
      enable = true;
      browsing = true;

      drivers = with pkgs; [
        gutenprint
        canon-cups-ufr2
      ];
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
