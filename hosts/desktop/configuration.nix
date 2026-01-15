{ lib, pkgs, inputs, ... }: {

  imports =
  [ 
    ./hardware-configuration.nix
    inputs.sops-nix.nixosModules.sops
    ../../nixos
  ];

  config = {
    environment.systemPackages = with pkgs; [
       vim 
       wget
       git
       home-manager
    ];

    enableAllPrograms_nixos = lib.mkForce true;
    
    # Replace with your own
    system.stateVersion = "24.11";
  };
}
