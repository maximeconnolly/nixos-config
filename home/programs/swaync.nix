{ pkgs, ... }:

{
  home.packages = with pkgs; [ swaynotificationcenter ];

  xdg.configFile."swaync/config.json".text = ''
    {
      "positionX": "right",
      "positionY": "top",
      "layer": "overlay",
      "control-center-layer": "top",
      "layer-shell": true,
      "cssPriority": "user",
      "control-center-margin-top": 0,
      "control-center-margin-bottom": 0,
      "control-center-margin-right": 0,
      "control-center-margin-left": 0,
      "notification-2fa-action": true,
      "notification-inline-replies": false,
      "notification-icon-size": 64,
      "notification-body-image-height": 100,
      "notification-body-image-width": 200,
      "timeout": 10,
      "timeout-low": 5,
      "timeout-critical": 0,
      "fit-to-screen": true,
      "control-center-width": 500,
      "control-center-height": 600,
      "notification-window-width": 500,
      "keyboard-shortcuts": true,
      "image-visibility": "when-available",
      "transition-time": 200,
      "hide-on-clear": false,
      "hide-on-action": true,
      "script-fail-notify": true,
      "widgets": [
        "title",
        "dnd",
        "notifications"
      ],
      "widget-config": {
        "title": {
          "text": "Notifications",
          "clear-all-button": true,
          "button-text": "Clear All"
        },
        "dnd": {
          "text": "Do Not Disturb"
        },
        "label": {
          "max-lines": 5,
          "text": "Label Text"
        },
        "mpris": {
          "image-size": 96,
          "image-radius": 12
        }
      }
    }
  '';

  xdg.configFile."swaync/style.css".text = ''
    * {
      font-family: "JetBrainsMono Nerd Font", "Symbols Nerd Font", Roboto, Helvetica, Arial, sans-serif;
    }

    .control-center .notification-row:focus,
    .control-center .notification-row:hover {
      opacity: 1;
      background: rgba(191, 90, 242, 0.1);
    }

    .notification-row {
      outline: none;
      margin: 10px;
      padding: 0;
    }

    .notification {
      background: transparent;
      padding: 0;
      margin: 0px;
    }

    .notification-content {
      background: rgba(68, 0, 107, 0.95);
      padding: 10px;
      border-radius: 10px;
      border: 1px solid #bf5af2;
      margin: 0;
    }

    .notification-default {
      background: rgba(68, 0, 107, 0.95);
      color: #ffffff;
    }

    .notification-critical {
      background: rgba(255, 85, 85, 0.9);
      border: 1px solid #ff5555;
      color: #ffffff;
    }

    .notification-error {
      background: rgba(255, 85, 85, 0.9);
      border: 1px solid #ff5555;
      color: #ffffff;
    }

    .notification-warning {
      background: rgba(255, 184, 108, 0.9);
      border: 1px solid #ffb86c;
      color: #ffffff;
    }

    .notification-info {
      background: rgba(68, 0, 107, 0.95);
      color: #ffffff;
    }

    .control-center {
      background: rgba(40, 42, 54, 0.95);
      border: 2px solid #bf5af2;
      border-radius: 10px;
      padding: 10px;
    }

    .control-center-list {
      background: transparent;
    }

    .floating-notifications {
      background: transparent;
    }

    /* Widgets */
    .widget-title {
      color: #bf5af2;
      background: transparent;
      font-size: 1.5rem;
      font-weight: bold;
      margin: 10px 0;
    }

    .widget-title > button {
      font-size: 1rem;
      color: #ffffff;
      text-shadow: none;
      background: #bf5af2;
      border: none;
      box-shadow: none;
      border-radius: 5px;
      padding: 5px 10px;
    }

    .widget-title > button:hover {
      background: #d47aff;
    }

    .widget-dnd {
      background: transparent;
      margin: 10px 0;
      color: #ffffff;
      font-size: 1.1rem;
    }

    .widget-dnd > switch {
      border-radius: 15px;
      background: #44475a;
    }

    .widget-dnd > switch:checked {
      background: #bf5af2;
    }

    .widget-dnd > switch slider {
      background: #f8f8f2;
      border-radius: 15px;
    }

    .summary {
      font-size: 1.1rem;
      font-weight: bold;
      color: #bd93f9;
    }

    .body {
      color: #f8f8f2;
      font-size: 0.9rem;
    }

    .time {
      color: #6272a4;
      font-size: 0.8rem;
    }
  '';
}
