pallete:
/*
css
*/
''
  /* Tokyo Night Color Palette */
  @define-color bg-primary #${pallete.base00};
  @define-color bg-secondary #${pallete.base01};
  @define-color bg-float #${pallete.base02};
  @define-color fg-primary #${pallete.base05};
  @define-color fg-secondary #${pallete.base04};
  @define-color fg-dark #${pallete.base03};
  @define-color blue #${pallete.base0D};
  @define-color cyan #${pallete.base0C};
  @define-color red #${pallete.base08};
  @define-color red-hover #${pallete.base08};
  @define-color green #${pallete.base0B};
  @define-color yellow #${pallete.base0A};
  @define-color magenta #${pallete.base0E};

    * {
      border: none;
      border-radius: 0;
      font-family: "JetBrainsMono Nerd Font", "Noto Sans CJK JP", sans-serif;
      font-size: 13px;
      min-height: 0;
    }

    window#waybar {
      background: transparent;
      color: @fg-secondary;
    }

    /* Base module styling */
    #network,
    #pulseaudio,
    #window,
    #custom-nixos,
    #language,
    #clock,
    #custom-power {
      padding: 8px 14px;
      margin: 0 4px;
      background: rgba(26, 27, 38, 0.95);
      border-radius: 12px;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    /* Blue accent modules */
    #network,
    #pulseaudio,
    #window,
    #custom-nixos,
    #language {
      color: @blue;
      font-weight: bold;
    }

    /* Font sizes */
    #pulseaudio,
    #window,
    #language {
      font-size: 12px;
    }

    #custom-nixos {
      font-size: 18px;
    }

    #custom-power {
      font-size: 16px;
    }

    /* State variations */
    #pulseaudio.muted {
      color: @red;
    }

    #clock {
      padding: 8px 20px;
      color: @fg-primary;
      font-weight: 500;
    }

    #custom-power {
      color: @red;
    }

    #custom-power:hover {
      color: @red-hover;
      background: rgba(247, 118, 142, 0.2);
    }

    /* Workspaces */
    #workspaces {
      margin: 0 4px;
      background: rgba(26, 27, 38, 0.95);
      padding: 4px 8px;
      border-radius: 12px;
    }

    #workspaces button {
      padding: 0 10px;
      color: @fg-dark;
      background: transparent;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      border-radius: 10px;
      margin: 0 2px;
    }

    #workspaces button.active {
      color: @blue;
      background: rgba(122, 162, 247, 0.15);
    }

    #workspaces button.urgent {
      color: @red;
      background: rgba(247, 118, 142, 0.15);
    }

    #workspaces button:hover {
      color: @cyan;
      background: rgba(125, 207, 255, 0.1);
    }

    /* Hover effects for modules */
    #pulseaudio:hover,
    #window:hover,
    #custom-nixos:hover,
    #language:hover,
    #clock:hover {
      background: rgba(26, 27, 38, 1);
    }

    /* Battery states */
    #battery.warning {
      color: @yellow;
    }

    #battery.critical {
      color: @red;
    }
''
