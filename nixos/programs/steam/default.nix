{ lib, config, inputs, pkgs, ... }: {

  imports = with inputs.nix-gaming.nixosModules; [
    platformOptimizations
  ];

  options = {
    steam_nixos.enable = 
      lib.mkEnableOption "Enables Steam and related programs with NixOS modules";
  };

  config = lib.mkIf config.steam_nixos.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      platformOptimizations.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin
        inputs.nix-gaming.packages.${pkgs.stdenv.hostPlatform.system}.proton-osu-bin
      ];
    };

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
