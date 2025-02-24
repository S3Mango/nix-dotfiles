{ lib, config, ... }: {

  options = {
    audio_nixos.enable = 
      lib.mkEnableOption "Enables Pipewire audio server with NixOS modules";
  };

  config = lib.mkIf config.audio_nixos.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
  };

}

