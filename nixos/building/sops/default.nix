{ lib, config, inputs, pkgs, ... }: {

  imports = [
    inputs.sops-nix.nixosModules.sops
  ];

  options = {
    sops_nixos.enable = 
      lib.mkEnableOption "Enables sops secret management with NixOS modules";
  };

  config = lib.mkIf config.sops_nixos.enable {

    environment.systemPackages = with pkgs; [
      sops
    ];

    sops.defaultSopsFile = ../../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/s3mango/.config/sops/age/keys.txt";
    
    sops.secrets.printer_ip = {};
  };
}
