{ lib, config, ... }: {

  options = {
    autostart_hyprland.enable = 
      lib.mkEnableOption "Autostarts Hyprland on login";
  };

  config = lib.mkIf config.autostart_hyprland.enable {
    programs.zsh.shellInit = ''
      if [ "$(tty)" = "/dev/tty1" ]; then
        exec Hyprland &> /dev/null
      fi
    '';
  };

}
