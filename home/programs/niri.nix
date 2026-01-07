{ pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    // output "*" {
    //     scale 1.0
    // }

    layout {
        gaps 16
        center-focused-column "never"
        default-column-width { proportion 0.5; }
    }

    spawn-at-startup "xwayland-satellite"
    spawn-at-startup "waybar"

    spawn-at-startup "swayidle" "-w" \
                     "timeout" "300" "swaylock -f" \
                     "timeout" "600" "niri msg action power-off-monitors" \
                     "before-sleep" "swaylock -f"

    binds {
        "Mod+L" { spawn "swaylock"; }
        "Mod+Return" { spawn "alacritty"; }
        "Mod+D" { spawn "wofi" "--show" "drun"; }
        "Mod+Q" { close-window; }
        
        "Mod+Left" { focus-column-left; }
        "Mod+Right" { focus-column-right; }

        "Mod+1" { focus-workspace 1; }
        "Mod+2" { focus-workspace 2; }
        "Mod+3" { focus-workspace 3; }
        "Mod+4" { focus-workspace 4; }
        "Mod+5" { focus-workspace 5; }
        "Mod+6" { focus-workspace 6; }
        "Mod+7" { focus-workspace 7; }
        "Mod+8" { focus-workspace 8; }
        "Mod+9" { focus-workspace 9; }
        
        "Mod+Shift+1" { move-column-to-workspace 1; }
        "Mod+Shift+2" { move-column-to-workspace 2; }
        "Mod+Shift+3" { move-column-to-workspace 3; }
        "Mod+Shift+4" { move-column-to-workspace 4; }
        "Mod+Shift+5" { move-column-to-workspace 5; }
        "Mod+Shift+6" { move-column-to-workspace 6; }
        "Mod+Shift+7" { move-column-to-workspace 7; }
        "Mod+Shift+8" { move-column-to-workspace 8; }
        "Mod+Shift+9" { move-column-to-workspace 9; }

        "Mod+Shift+E" { quit; }
    }
  '';
}
