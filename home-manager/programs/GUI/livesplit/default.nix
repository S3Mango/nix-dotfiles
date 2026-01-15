{ lib, config, pkgs, ... }:

let
  cfg = config.livesplit_home-manager;

  livesplit-one = pkgs.rustPlatform.buildRustPackage rec {
    pname = "livesplit-one-druid";
    version = "0.6.0";

    src = pkgs.fetchFromGitHub {
      owner = "AlexKnauth";
      repo = "livesplit-one-druid";
      rev = version;
      sha256 = "sha256-1ZZXNAnZ11vwORQu3lwZOnSMIA6SBcyKxr2/VNnxut8=";
    };

    cargoLock = {
      lockFile = src + "/Cargo.lock";
      outputHashes = {
        "druid-0.8.3" = "sha256-qx0NVoeDkxtlKxh9LbkeNs3eguibvYCcXTZ/LUuDFWY=";
        "livesplit-auto-splitting-0.1.0" = "sha256-LcxcAYJQCFj33amVr1qwxBWVsjImv2LCzbgUzQ+1th8=";
      };
    };

    nativeBuildInputs = with pkgs; [
      pkg-config
      wrapGAppsHook
    ];

    buildInputs = with pkgs; [
      glib
      gtk3
      cairo
      gdk-pixbuf
      pango
      atk
    ];

    cargoBuildFlags = [ "--bin" "livesplit-one" ];
    cargoInstallFlags = [ "--path" "." ];

    doCheck = false;

    meta = with lib; {
      description = "LiveSplit One port using Druid UI toolkit";
      homepage = "https://github.com/AlexKnauth/livesplit-one-druid";
      license = licenses.mit;
      maintainers = [];
      platforms = platforms.linux;
    };
  };

in
{
  options = {
    livesplit_home-manager.enable =
      lib.mkEnableOption "Enables configuration of livesplit-one-druid with Home Manager";
  };

  config = lib.mkIf cfg.enable {
    # Install the wrapper, not the raw Nix store binary
    home.packages = [ livesplit-one ];

  };
}

