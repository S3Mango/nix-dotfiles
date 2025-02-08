{ lib, config, ... }: {

  options = {
    hostMachine = lib.mkOption {
      type = lib.types.str;
      default = "desktop";
      description = "Which host to use when building a configuration for NixOS and home-manager";
    };

    zsh-home_manager.enable = lib.mkOption {
      default = true;
      description = "Enables zsh configuration on home-manager";
    };
  };

  config = lib.mkIf config.zsh-home_manager.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
  
      initExtra = ''
        function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }

        function zz {
          if [ -z $1 ]; then
            z . && y
          else
            z $1 && y
          fi
        }

        function sys {
          if [[ $1 == "add" ]]; then
            wd=$(pwd)
            z ~/.dotfiles/
            sudo git add .
            z $wd
          fi
          sudo nixos-rebuild switch --flake ~/.dotfiles#${config.hostMachine}
        }

        function home {
          if [[ $1 == "add" ]]; then
            wd=$(pwd)
            z ~/.dotfiles/
            sudo git add .
            z $wd
          fi
          home-manager switch --flake ~/.dotfiles#${config.hostMachine}
        }

        function up {
          if [[ $1 == "add" ]]; then
            wd=$(pwd)
            z ~/.dotfiles/
            sudo git add .
            z $wd
          fi
          sudo nix flake update --flake ~/.dotfiles/
        }
      '';
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
