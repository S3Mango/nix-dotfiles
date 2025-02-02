{ lib, config, ... }: {

  options = {
    equibop_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of Equibop with home-manager";
    };
  };

  config = lib.mkIf config.equibop_home-manager.enable {
    services.flatpak.packages = [
      { appId = "io.github.equicord.equibop"; origin = "flathub"; }
    ];

#    home.activation.copyConfigs = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
#      mkdir -p ${config.home.homeDirectory}/.var/app/io.github.equicord.equibop/config/equibop/settings
#      cp -r ${./config_files}/* ${config.home.homeDirectory}/.var/app/io.github.equicord.equibop/config/equibop/settings/
#    '';
  };
}

