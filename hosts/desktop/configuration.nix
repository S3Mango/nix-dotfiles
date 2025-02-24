{ lib, pkgs, ... }: {

  imports =
  [ 
    ./hardware-configuration.nix
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
