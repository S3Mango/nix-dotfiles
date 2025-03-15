{ lib, config, pkgs, ... }: {

  options = {
    wlogout_home-manager.enable = 
      lib.mkEnableOption "Enables configuration of Wlogout with home-manager";
  };

  config =
  let 
    iconPath = "/home/${config.home.username}/.config/wlogout/icons";
  in lib.mkIf config.wlogout_home-manager.enable {
    home.packages = with pkgs; [
      wlogout
    ];

    home.file = {
      ".config/wlogout/icons" = {
        source = ./icons;
        recursive = true;
      };
    };

    programs.wlogout = {
      enable = true;
      layout = [
        {
          "label" = "shutdown";
          "action" = "sleep 1; systemctl poweroff";
          "text" = "Shutdown";
          "keybind" = "s";
        }
        {
          "label" = "reboot";
          "action" = "sleep 1; systemctl reboot";
          "text" = "Reboot";
          "keybind" = "r";
        }
        {
          "label" = "logout";
          "action" = "sleep 1; hyprctl dispatch exit";
          "text" = "Exit";
          "keybind" = "e";
        }
        {
          "label" = "suspend";
          "action" = "sleep 1; systemctl suspend";
          "text" = "Suspend";
          "keybind" = "u";
        }
        {
          "label" = "lock";
          "action" = "sleep 1; hyprlock";
          "text" = "Lock";
          "keybind" = "l";
        }
        {
          "label" = "hibernate";
          "action" = "sleep 1; systemctl hibernate";
          "text" = "Hibernate";
          "keybind" = "h";
        }
      ];

      style = ''
        * {
          font-family: "Noto Sans";
          background-image: none;
          transition: 20ms;
        }
        window {
          background-color: rgba(12, 12, 12, 0.1);
        }
        button {
          color: #FFFFFF;
          font-size:20px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
          background-color: rgba(30, 36, 46, 0.45); 
        }
        button:focus,
        button:active,
        button:hover {
          color: #FFFFFF;
          background-color: rgba(30, 36, 46, 0.65); 
        }
        #logout {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/logout.png");
        }
        #suspend {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/suspend.png");
        }
        #shutdown {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/shutdown.png");
        }
        #reboot {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/reboot.png");
        }
        #lock {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/lock.png");
        }
        #hibernate {
          margin: 10px;
          border-radius: 20px;
          background-image: url("${iconPath}/hibernate.png");
        }
      '';
    };
  };
}

