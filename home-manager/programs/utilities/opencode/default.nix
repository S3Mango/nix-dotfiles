{ lib, config, pkgs, ... }: 
let
  coach = pkgs.writeShellScriptBin "coach" ''
      cd ~/life_coach && opencode --agent coach
  '';
in
{

  options = {
    opencode_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of opencode with home-manager";
  };

  config = lib.mkIf config.opencode_home-manager.enable {

    programs.opencode = {
      enable = true;

      settings = {
        "$schema" = "https://opencode.ai/config.json";
        provider = {
          openrouter = {
            models = {
              "xiaomi/mimo-v2-flash:free" = {
                options = {
                  provider = {
                    allow_fallbacks = true;
                  };
                };
              };
            };
          };
        };
      };
    };

    home.packages = [
      pkgs.opencode
      coach
    ];
  };
}
