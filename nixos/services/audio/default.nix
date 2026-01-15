{ lib, config, inputs, ... }: {

  imports = with inputs.nix-gaming.nixosModules; [
    pipewireLowLatency
  ];

  options = {
    audio_nixos.enable = 
      lib.mkEnableOption "Enables Pipewire audio server with NixOS modules";
  };

  config = lib.mkIf config.audio_nixos.enable {
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;

      lowLatency = {
        enable = true;
        quantum = 64;
        rate = 48000;
      };
    };

    security.rtkit.enable = true;
  };
}
