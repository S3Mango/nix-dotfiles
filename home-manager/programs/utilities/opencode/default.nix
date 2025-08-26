{ lib, config, pkgs, ... }: {

  options = {
    opencode_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of opencode with home-manager";
  };

  config = lib.mkIf config.opencode_home-manager.enable {
    home.packages = with pkgs; [
      opencode
    ];

    programs.opencode = {
      enable = true;

      settings = {
        "$schema" = "https://opencode.ai/config.json";
        model = "deepseek/deepseek-chat-v3-0324:free";

        provider = {
          openrouter = {
            models = {
              "google/gemini-2.0-flash-exp:free" = {
                options = {
                  provider = {
                    allow_fallbacks = true;
                  };
                };
              };
              "qwen/qwen3-coder:free" = {
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
  };

}

