{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", "Font Awesome 6 Free", Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
      }
      
      window#waybar {
        background-color: rgba(43, 48, 59, 0.95);
        color: #ffffff;
      }
      
      #workspaces button {
        padding: 0 5px;
        color: #ffffff;
      }
      
      #workspaces button.focused {
        background-color: #64727D;
        box-shadow: inset 0 -3px #ffffff;
      }
      
      #clock,
      #battery,
      #cpu,
      #memory,
      #tray {
        padding: 0 10px;
        color: #ffffff;
      }

      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }

      #pulseaudio-slider trough {
        min-height: 10px;
        min-width: 80px;
        border-radius: 5px;
        background-color: #4c566a;
      }

      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: #ffffff;
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "battery" "pulseaudio" "pulseaudio/slider" "tray" ];

        "niri/workspaces" = {
            all-outputs = true;
        };
        
        "clock" = {
            format = "{:%Y-%m-%d %H:%M}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt>{calendar}</tt>";
        };

        "cpu" = {
            format = "{usage}% ";
            tooltip = false;
        };

        "memory" = {
            format = "{}% ";
        };

        "battery" = {
            states = {
                warning = 30;
                critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% ";
            format-plugged = "{capacity}% ";
            format-icons = ["" "" "" "" ""];
        };

        "pulseaudio" = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% {icon}";
            format-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = ["" ""];
            };
            scroll-step = 1;
            on-click = "pavucontrol";
            ignored-sinks = ["Easy Effects Sink"];
        };

        "pulseaudio/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
        };
      };
    };
  };
}
