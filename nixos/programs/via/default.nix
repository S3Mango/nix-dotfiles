{ lib, config, pkgs, ... }: {

  options = {
    via_nixos.enable = 
      lib.mkEnableOption "Enables VIA with NixOS modules";
  };

  config = lib.mkIf config.via_nixos.enable {
    environment.systemPackages = with pkgs; [
      via
    ];
    services.udev.extraRules = ''
      # QK100 - ANSI
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", ATTRS{idVendor}=="05ac", ATTRS{idProduct}=="024f", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };
}
