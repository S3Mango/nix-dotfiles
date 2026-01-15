{ lib, config, pkgs, ... }: {

  options = {
    librechat_nixos.enable = 
      lib.mkEnableOption "Enables LibreChat with NixOS modules";
  };

  config = lib.mkIf config.librechat_nixos.enable {
    environment.systemPackages = with pkgs; [
      librechat
    ];

    services.mongodb = {
      enable = true;
      bind_ip = "127.0.0.1";
    };

    environment.sessionVariables = {
      MONGO_URI = "mongodb://localhost:27017/LibreChat";
    };

  };
}
