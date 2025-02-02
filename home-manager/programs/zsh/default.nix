{ lib, config, pkgs, ... }: {

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
        eval "$(zoxide init zsh)"

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
      '';

      shellAliases = {
        sys = "sudo nixos-rebuild switch --flake ~/.dotfiles#${config.hostMachine}";
        home = "home-manager switch --flake ~/.dotfiles#${config.hostMachine}";
        up = "sudo nix flake update --flake ~/.dotfiles/";
      };
    };
  };
}
