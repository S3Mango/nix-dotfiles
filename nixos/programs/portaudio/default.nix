{ lib, config, pkgs, ... }: {

  options = {
    portaudio_nixos.enable = 
      lib.mkEnableOption "Enables portaudio with NixOS modules";
  };

  config = lib.mkIf config.portaudio_nixos.enable {
    environment.systemPackages = with pkgs; [
      portaudio
    ];
  };
}
