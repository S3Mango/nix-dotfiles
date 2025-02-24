{ lib, config, ... }: {

  options = {
    keymap_nixos.enable = 
      lib.mkEnableOption "Enables configuration of keymap in x11 with NixOS modules";
  };

  config = lib.mkIf config.keymap_nixos.enable {
    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };
  };

}
