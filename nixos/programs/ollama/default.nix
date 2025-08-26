{ lib, config, pkgs, ... }: {

  options = {
    ollama_nixos.enable = 
      lib.mkEnableOption "Enables Ollama with NixOS modules";
  };

  config = lib.mkIf config.hyprland_nixos.enable {
    environment.systemPackages = with pkgs; [
      ollama
    ];

    services.ollama = {
      enable = true;
    };
  };

}
