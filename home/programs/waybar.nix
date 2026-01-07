{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: Roboto, Helvetica, Arial, sans-serif;
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
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "cpu" "memory" "battery" "tray" ];

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
      };
    };
  };
}
