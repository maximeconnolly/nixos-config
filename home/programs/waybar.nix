{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", "Font Awesome 6 Free", Roboto, Helvetica, Arial, sans-serif;
        font-size: 13px;
        font-weight: 500;
      }
      
      window#waybar {
        background: linear-gradient(90deg, rgba(68, 0, 107, 0.95) 0%, rgba(88, 20, 127, 0.95) 100%);
        color: #ffffff;
        border-bottom: 2px solid #bf5af2;
        box-shadow: 0 2px 10px rgba(191, 90, 242, 0.3);
      }
      
      #workspaces {
        margin: 0 5px;
      }

      #workspaces button {
        padding: 0 8px;
        color: #ffffff;
        background-color: transparent;
        border: 1px solid transparent;
        border-radius: 4px;
        margin: 2px;
        transition: all 0.3s ease;
      }

      #workspaces button:hover {
        background-color: rgba(191, 90, 242, 0.3);
        border: 1px solid #bf5af2;
        box-shadow: 0 0 8px rgba(191, 90, 242, 0.5);
      }
      
      #workspaces button.focused {
        background: linear-gradient(135deg, #bf5af2 0%, #9d4ed4 100%);
        border: 1px solid #d47aff;
        box-shadow: 0 0 12px rgba(191, 90, 242, 0.8), inset 0 -2px 0 rgba(255, 255, 255, 0.3);
        font-weight: 700;
      }

      #workspaces button.urgent {
        background-color: #ff5555;
        border: 1px solid #ff7777;
        animation: blink 1s ease-in-out infinite;
      }

      @keyframes blink {
        0% { opacity: 1; }
        50% { opacity: 0.5; }
        100% { opacity: 1; }
      }

      #window {
        margin: 0 10px;
        color: #bf5af2;
        font-weight: 600;
        text-shadow: 0 0 5px rgba(191, 90, 242, 0.5);
      }
      
      #clock {
        padding: 0 15px;
        color: #ffffff;
        background: linear-gradient(135deg, rgba(191, 90, 242, 0.3) 0%, rgba(157, 78, 212, 0.3) 100%);
        border: 1px solid #bf5af2;
        border-radius: 6px;
        margin: 3px 5px;
        font-weight: 700;
        box-shadow: 0 2px 8px rgba(191, 90, 242, 0.4);
        text-shadow: 0 0 8px rgba(191, 90, 242, 0.8);
      }

      #battery,
      #cpu,
      #memory,
      #network,
      #pulseaudio,
      #bluetooth,
      #custom-notification,
      #custom-keyboard-layout {
        padding: 0 12px;
        margin: 3px 2px;
        color: #ffffff;
        background-color: rgba(191, 90, 242, 0.2);
        border: 1px solid rgba(191, 90, 242, 0.5);
        border-radius: 6px;
        transition: all 0.3s ease;
      }

      #battery:hover,
      #cpu:hover,
      #memory:hover,
      #network:hover,
      #pulseaudio:hover,
      #bluetooth:hover,
      #custom-notification:hover,
      #custom-keyboard-layout:hover {
        background-color: rgba(191, 90, 242, 0.4);
        box-shadow: 0 0 10px rgba(191, 90, 242, 0.6);
        border-color: #bf5af2;
      }

      #bluetooth {
        color: #8be9fd;
        border-color: rgba(139, 233, 253, 0.5);
      }

      #bluetooth:hover {
        background-color: rgba(139, 233, 253, 0.2);
        box-shadow: 0 0 10px rgba(139, 233, 253, 0.4);
      }

      #custom-keyboard-layout {
        color: #ffb86c;
        border-color: rgba(255, 184, 108, 0.5);
      }

      #custom-keyboard-layout:hover {
        background-color: rgba(255, 184, 108, 0.2);
        box-shadow: 0 0 10px rgba(255, 184, 108, 0.4);
      }

      #cpu {
        color: #50fa7b;
        border-color: rgba(80, 250, 123, 0.5);
      }

      #cpu:hover {
        background-color: rgba(80, 250, 123, 0.2);
        box-shadow: 0 0 10px rgba(80, 250, 123, 0.4);
      }

      #memory {
        color: #8be9fd;
        border-color: rgba(139, 233, 253, 0.5);
      }

      #memory:hover {
        background-color: rgba(139, 233, 253, 0.2);
        box-shadow: 0 0 10px rgba(139, 233, 253, 0.4);
      }

      #network {
        color: #bd93f9;
        border-color: rgba(189, 147, 249, 0.5);
      }

      #network:hover {
        background-color: rgba(189, 147, 249, 0.2);
        box-shadow: 0 0 10px rgba(189, 147, 249, 0.4);
      }

      #network.disconnected {
        color: #ff5555;
        border-color: rgba(255, 85, 85, 0.5);
      }

      #battery {
        color: #f1fa8c;
        border-color: rgba(241, 250, 140, 0.5);
      }

      #battery:hover {
        background-color: rgba(241, 250, 140, 0.2);
        box-shadow: 0 0 10px rgba(241, 250, 140, 0.4);
      }

      #battery.warning {
        color: #ffb86c;
        border-color: #ffb86c;
        background-color: rgba(255, 184, 108, 0.2);
      }

      #battery.critical {
        color: #ff5555;
        border-color: #ff5555;
        background-color: rgba(255, 85, 85, 0.3);
        animation: blink 0.5s ease-in-out infinite;
      }

      #pulseaudio {
        color: #ff79c6;
        border-color: rgba(255, 121, 198, 0.5);
      }

      #pulseaudio:hover {
        background-color: rgba(255, 121, 198, 0.2);
        box-shadow: 0 0 10px rgba(255, 121, 198, 0.4);
      }

      #tray {
        padding: 0 10px;
        margin: 3px 5px;
        background-color: rgba(191, 90, 242, 0.15);
        border: 1px solid rgba(191, 90, 242, 0.4);
        border-radius: 6px;
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: #ff5555;
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
        background-color: rgba(76, 86, 106, 0.5);
        border: 1px solid rgba(191, 90, 242, 0.3);
      }

      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background: linear-gradient(90deg, #bf5af2 0%, #ff79c6 100%);
        box-shadow: 0 0 8px rgba(191, 90, 242, 0.6);
      }
    '';
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;
        
        modules-left = [ "niri/workspaces" "niri/window" ];
        modules-center = [ "clock" ];
        modules-right = [ "custom/keyboard-layout" "cpu" "memory" "battery" "network" "bluetooth" "pulseaudio" "pulseaudio/slider" "custom/notification" "tray" ];

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
            interval = "10";
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
            ignored-sinks = ["Easy Effects Sink"];
        };

        "pulseaudio/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
        };

        "network" = {
            format-wifi = "{essid} ({signalStrength}%) ";
            format-ethernet = "{ifname} ";
            format-disconnected = "Disconnected ";
            tooltip-format = "{ifname}: {ipaddr}/{cidr}";
            tooltip-format-wifi = "{essid} ({signalStrength}%)\n{ifname}: {ipaddr}/{cidr}";
            tooltip-format-ethernet = "{ifname}: {ipaddr}/{cidr}";
            tooltip-format-disconnected = "Disconnected";
            on-click = "${pkgs.networkmanager_dmenu}/bin/networkmanager_dmenu";
        };

        "bluetooth" = {
            format = " {status}";
            format-connected = " {device_alias}";
            format-connected-battery = " {device_alias} {device_battery_percentage}%";
            tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
            tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
            on-click = "${pkgs.blueman}/bin/blueman-manager";
        };


        "custom/keyboard-layout" = {
            exec = "/home/mconnolly/nixos-config/home/scripts/keyboard-layout.sh";
            return-type = "json";
            interval = 1;
            format = "{}";
        };

        "custom/notification" = {
            tooltip = false;
            format = "{icon}";
            format-icons = {
                notification = "<span foreground='red'><sup></sup></span>";
                none = "";
                dnd-notification = "<span foreground='red'><sup></sup></span>";
                dnd-none = "";
                inhibited-notification = "<span foreground='red'><sup></sup></span>";
                inhibited-none = "";
                dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
                dnd-inhibited-none = "";
            };
            return-type = "json";
            exec-if = "which swaync-client";
            exec = "swaync-client -swb";
            on-click = "swaync-client -t -sw";
            on-click-right = "swaync-client -d -sw";
            escape = true;
        };
      };
    };
  };
}
