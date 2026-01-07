{ pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
      gtk_dark = true;
    };
    
    style = ''
      window {
        margin: 0px;
        border: 2px solid #bf5af2;
        background-color: rgba(68, 0, 107, 0.95);
        border-radius: 10px;
      }

      #input {
        margin: 5px;
        border: 1px solid #bf5af2;
        color: #ffffff;
        background-color: rgba(68, 0, 107, 0.95);
        border-radius: 5px;
        padding: 8px;
      }

      #inner-box {
        margin: 5px;
        border: none;
        background-color: transparent;
      }

      #outer-box {
        margin: 5px;
        border: none;
        background-color: transparent;
      }

      #scroll {
        margin: 0px;
        border: none;
      }

      #text {
        margin: 5px;
        border: none;
        color: #ffffff;
      }

      #entry:selected {
        background-color: #bf5af2;
        color: #ffffff;
        border-radius: 5px;
      }

      #entry:hover {
        background-color: rgba(191, 90, 242, 0.5);
        border-radius: 5px;
      }
    '';
  };
}
