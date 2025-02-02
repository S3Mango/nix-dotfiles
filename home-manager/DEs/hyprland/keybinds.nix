{ lib, config, ... }: {

  options = {
    hyprland_keybinds.enable = lib.mkOption {
      default = true;
      description = "Enables keybinds on Hyprland";
    };
  };

  config = lib.mkIf config.hyprland_keybinds.enable {
    wayland.windowManager.hyprland = {
      settings = {
        "$mod" = "CONTROL_L";

        "$terminal" = "kitty";
        "$browser" = "firefox";
        "$discord" = "flatpak run io.github.equicord.equibop";
        
        bind = [
          # Kill focused window
          "$mod SHIFT, E, exec, hyprctl dispatch killactive"

          # Toggle whether the active window is floating
          "$mod, mouse:274, togglefloating"

          # Terminal related keybinds
          "$mod SHIFT, S, exec, $terminal"
          "ALT SHIFT, S, split:workspace, emptynm"
          "ALT SHIFT, S, exec, $terminal"
       

          # Discord related keybinds
          "$mod SHIFT, D, exec, $discord"
          "ALT SHIFT, D, split:workspace, emptynm"
          "ALT SHIFT, D, exec, $discord"

          # Yazi related keybinds
          # "$mod SHIFT, Z, exec, kitty --session ~/.config/kitty/yazi"
          # "ALT SHIFT, Z, split:workspace, emptynm"
          # "ALT SHIFT, Z, exec, kitty --session ~/.config/kitty/yazi"

          # Browser related keybinds
          "$mod SHIFT, A, exec, $browser"
          "ALT SHIFT, A, split:workspace, emptynm"
          "ALT SHIFT, A, exec, $browser"
     
          # Spotify related keybinds
          "$mod SHIFT, R, exec, spotify"
          "ALT SHIFT, R, split:workspace, emptynm"
          "ALT SHIFT, R, exec, spotify"

          # Steam related keybinds
          "$mod SHIFT, E, exec, steam"
          "ALT SHIFT, E, split:workspace, emptynm"
          "ALT SHIFT, E, exec, steam"

          # Rofi
          "SUPER, SUPER_L, exec, pkill -x rofi || rofi -show drun" # Add theming later
     
          # Screenshot
          "SUPER SHIFT, S, exec, grim -g \"$(slurp -d)\" - | wl-copy"

          # Clipboard history 
          # "$mod SHIFT, Q, exec pkill -x rofi || ~/Scripts/cliphist.sh c" 

          # Move focus
          "SUPER, H, movefocus, l"
          "SUPER, L, movefocus, r"
          "SUPER, J, movefocus, d"
          "SUPER, K, movefocus, u"

          # Switch workspaces
          "ALT, 1, split:workspace, 1"
          "ALT, 2, split:workspace, 2"
          "ALT, 3, split:workspace, 3"
          "ALT, 4, split:workspace, 4"
          "ALT, 5, split:workspace, 5"
          "ALT, 6, split:workspace, 6"
          "ALT, 7, split:workspace, 7"
          "ALT, 8, split:workspace, 8"
          "ALT, 9, split:workspace, 9"
          "ALT, 0, split:workspace, 10"

          # Move focused window to a workspace
          "ALT SHIFT, 1, split:movetoworkspace, 1"
          "ALT SHIFT, 2, split:movetoworkspace, 2"
          "ALT SHIFT, 3, split:movetoworkspace, 3"
          "ALT SHIFT, 4, split:movetoworkspace, 4"
          "ALT SHIFT, 5, split:movetoworkspace, 5"
          "ALT SHIFT, 6, split:movetoworkspace, 6"
          "ALT SHIFT, 7, split:movetoworkspace, 7"
          "ALT SHIFT, 8, split:movetoworkspace, 8"
          "ALT SHIFT, 9, split:movetoworkspace, 9"
          "ALT SHIFT, 0, split:movetoworkspace, 10"

          # Switch workspaces to a relative workspace (per monitor)
          "ALT, J, split:workspace, m-1"
          "ALT, K, split:workspace, m+1"

          # Move window to the first empty workspace
          "$mod SHIFT, X, split:movetoworkspace, emptynm"
     
          # Send to empty workspace silently
          "SUPER, W, split:movetoworkspacesilent, emptynm"

          # Go to previous workspace
          "ALT, TAB, split:workspace, previous_per_monitor"
        ];
        
        "$moveactivewindow" = "grep -q \"true\" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive";

        binded = [
          # Move active window around current workspace
          "$mod ALT, H, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l"
          "$mod ALT, L, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow r"
          "$mod ALT, K, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow u"
          "$mod ALT, J, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow d"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  };
}

