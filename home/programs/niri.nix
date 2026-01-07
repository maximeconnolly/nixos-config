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

        "Mod+Shift+E" { quit; }
    }
  '';
}
