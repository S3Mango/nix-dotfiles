{ lib, config, pkgs, ... }: {

  options = {
    steam_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables Steam and related programs with NixOS modules";
    };
  };

  config = lib.mkIf config.steam_nixos.enable {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
