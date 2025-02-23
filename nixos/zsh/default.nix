{ lib, config, ... }: {

  options = {
    zsh_nixos.enable = lib.mkOption {
      default = true;
      description = "Enables ZSH with NixOS modules";
    };
  };

  config = lib.mkIf config.zsh_nixos.enable {
    programs.zsh.enable = true;
  };

}
