{ lib, config, ... }: {

  options = {
    autostart_hyprland.enable = lib.mkOption {
      default = true;
      description = "Autostarts Hyprland on login";
    };
  };

  config = lib.mkIf config.autostart_hyprland.enable {
    programs.zsh.shellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };
}
