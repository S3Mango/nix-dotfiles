{ lib, config, pkgs, inputs, ... }: {

  options = {
    firefox_home-manager.enable = lib.mkOption {
      default = true;
      description = "Enables configuration of firefox with home-manager";
    };
  };

  config = lib.mkIf config.firefox_home-manager.enable {
    home.packages = with pkgs; [
      firefox
    ];

    programs.firefox = {
      enable = true;
      profiles.s3mango = {
        extensions = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          bitwarden
          ublock-origin
          sponsorblock
          darkreader
          # scroll_anywhere
          # imagus
        ];
      };
    };
  };
}
