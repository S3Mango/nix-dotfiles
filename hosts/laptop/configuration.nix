{ pkgs, ... }: {

  imports =
  [ 
    ./hardware-configuration.nix
    ../../nixos
  ];

  config = {
    hostMachine = "laptop";

    environment.systemPackages = with pkgs; [
       vim 
       wget
       git
       home-manager
    ];
    
    # Replace with your own
    system.stateVersion = "24.11";
  };

}
