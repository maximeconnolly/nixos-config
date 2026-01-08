{ pkgs, ... }:

{
  xdg.configFile."niri/config.kdl".text = ''
    // output "*" {
    //     scale 1.0
    // }

    input {
        keyboard {
            xkb {
                layout "us,ca"
                variant ",multix"
            }
        }
    }

    layout {
        gaps 16
        center-focused-column "never"
        default-column-width { proportion 0.5; }
    }

    spawn-at-startup "xwayland-satellite"
    spawn-at-startup "waybar"
    spawn-at-startup "sh" "-c" "GDK_BACKEND=wayland swaync"
    spawn-at-startup "swaybg" "-i" "/home/mconnolly/nixos-config/media/background/wallpaper2.jpg" "-m" "fill"

    spawn-at-startup "swayidle" "-w" \
                     "timeout" "300" "swaylock -f" \
                     "timeout" "600" "niri msg action power-off-monitors" \
                     "before-sleep" "swaylock -f"

    binds {
        "Mod+L" { spawn "swaylock"; }
        "Mod+Return" { spawn "alacritty"; }
        "Mod+D" { spawn "wofi" "--show" "drun"; }
        "Mod+Q" { close-window; }
        "Mod+F" { maximize-column; }
        "Mod+Space" { switch-layout "next"; }
        
        "Mod+Left" { focus-column-left; }
        "Mod+Right" { focus-column-right; }
        "Mod+Up" { focus-workspace-up; }
        "Mod+Down" { focus-workspace-down; }

        "Mod+Shift+Left" { move-column-left-or-to-monitor-left; }
        "Mod+Shift+Right" { move-column-right-or-to-monitor-right; }

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

        "XF86AudioRaiseVolume" allow-when-locked=true { spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1+"; }
        "XF86AudioLowerVolume" allow-when-locked=true { spawn "${pkgs.wireplumber}/bin/wpctl" "set-volume" "@DEFAULT_AUDIO_SINK@" "0.1-"; }
        "XF86AudioMute" allow-when-locked=true { spawn "${pkgs.wireplumber}/bin/wpctl" "set-mute" "@DEFAULT_AUDIO_SINK@" "toggle"; }

        // Screenshots
        "Print" { spawn "sh" "-c" "${pkgs.grim}/bin/grim - | ${pkgs.wl-clipboard}/bin/wl-copy"; }
        "Mod+Shift+S" { spawn "sh" "-c" "${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.wl-clipboard}/bin/wl-copy"; }
        "Mod+Ctrl+S" { spawn "sh" "-c" "${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bin/slurp)\" - | ${pkgs.swappy}/bin/swappy -f -"; }
    }
  '';
}
