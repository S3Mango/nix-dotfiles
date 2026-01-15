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
        "$mod1" = "CONTROL_L";
        "$mod2" = "ALT_L";
        "$mod3" = "SUPER_L";

        "$terminal" = "kitty";
        "$browser" = "firefox";
        "$discord" = "equibop";
        
        input = {
          kb_options = "caps:super";
        };

        bind = [
          # Kill focused window
          "$mod1 SHIFT, W, exec, hyprctl dispatch killactive"

          # Toggle whether the active window is floating
          "$mod2, mouse:274, togglefloating"

          # Terminal related keybinds
          "$mod1 SHIFT, S, exec, $terminal"
          "$mod2 SHIFT, S, split:workspace, emptynm"
          "$mod2 SHIFT, S, exec, $terminal"

          # Discord related keybinds
          "$mod1 SHIFT, D, exec, $discord"
          "$mod2 SHIFT, D, split:workspace, emptynm"
          "$mod2 SHIFT, D, exec, $discord"

          # Yazi related keybinds
          "$mod1 SHIFT, Z, exec, kitty --session ~/.config/kitty/yazi"
          "$mod2 SHIFT, Z, split:workspace, emptynm"
          "$mod2 SHIFT, Z, exec, kitty --session ~/.config/kitty/yazi"

          # Browser related keybinds
          "$mod1 SHIFT, A, exec, $browser"
          "$mod2 SHIFT, A, split:workspace, emptynm"
          "$mod2 SHIFT, A, exec, $browser"
     
          # Spotify related keybinds
          "$mod1 SHIFT, R, exec, spotify"
          "$mod2 SHIFT, R, split:workspace, emptynm"
          "$mod2 SHIFT, R, exec, spotify"

          # Steam related keybinds
          "$mod1 SHIFT, E, exec, steam"
          "$mod2 SHIFT, E, split:workspace, emptynm"
          "$mod2 SHIFT, E, exec, steam"

          # Rofi
          "SUPER, $mod3, exec, pkill -x rofi || rofi -show drun -config ~/.config/rofi/config.rasi" # Change SUPER to ALT if mod2 and mod3 are swapped

          # Reset Waybar
          "$mod1 $mod2, W, exec, pkill waybar"
          "$mod1 $mod2, W, exec, waybar"
     
          # Screenshot
          ''$mod3 SHIFT, S, exec, grim -g "$(slurp -d)" - | wl-copy''

          # Clipboard history 
          # "$mod SHIFT, Q, exec pkill -x rofi || ~/Scripts/cliphist.sh c" 

          # Move focus
          "$mod3, H, movefocus, l"
          "$mod3, L, movefocus, r"
          "$mod3, J, movefocus, d"
          "$mod3, K, movefocus, u"

          # Switch workspaces
          "$mod2, 1, split:workspace, 1"
          "$mod2, 2, split:workspace, 2"
          "$mod2, 3, split:workspace, 3"
          "$mod2, 4, split:workspace, 4"
          "$mod2, 5, split:workspace, 5"
          "$mod2, 6, split:workspace, 6"
          "$mod2, 7, split:workspace, 7"
          "$mod2, 8, split:workspace, 8"
          "$mod2, 9, split:workspace, 9"
          "$mod2, 0, split:workspace, 10"

          # Move focused window to a workspace
          "$mod2 SHIFT, 1, split:movetoworkspace, 1"
          "$mod2 SHIFT, 2, split:movetoworkspace, 2"
          "$mod2 SHIFT, 3, split:movetoworkspace, 3"
          "$mod2 SHIFT, 4, split:movetoworkspace, 4"
          "$mod2 SHIFT, 5, split:movetoworkspace, 5"
          "$mod2 SHIFT, 6, split:movetoworkspace, 6"
          "$mod2 SHIFT, 7, split:movetoworkspace, 7"
          "$mod2 SHIFT, 8, split:movetoworkspace, 8"
          "$mod2 SHIFT, 9, split:movetoworkspace, 9"
          "$mod2 SHIFT, 0, split:movetoworkspace, 10"

          # Switch workspaces to a relative workspace (per monitor)
          "$mod2, J, split:workspace, m-1"
          "$mod2, K, split:workspace, m+1"

          # Move window to the first empty workspace
          "$mod1 SHIFT, X, split:movetoworkspace, emptynm"
     
          # Send to empty workspace silently
          "$mod3, W, split:movetoworkspacesilent, emptynm"

          # Go to previous workspace
          "$mod2, TAB, split:workspace, previous_per_monitor"
        ];
        
        "$moveactivewindow" = "grep -q \"true\" <<< $(hyprctl activewindow -j | jq -r .floating) && hyprctl dispatch moveactive";

        binded = [
          # Move active window around current workspace
          "$mod1 $mod2, H, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow l"
          "$mod1 $mod2, L, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow r"
          "$mod1 $mod2, K, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow u"
          "$mod1 $mod2, J, Move activewindow to the right, exec, $moveactivewindow -30 0 || hyprctl dispatch movewindow d"
        ];

        bindm = [
          "$mod2, mouse:272, movewindow"
          "$mod2, mouse:273, resizewindow"
        ];
      };
    };
  };
}

