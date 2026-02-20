pallete:
/*
css
*/
''
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
      min-width: 0px;
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
    #custom-inhibitor,
    #language,
    #clock,
    #custom-power {
      padding: 8px 14px;
      margin: 4px 2px;
      background: @bg-primary;
      border-radius: 24px;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    /* Blue accent modules */
    #network,
    #pulseaudio,
    #window,
    #custom-inhibitor,
    #custom-nixos,
    #language {
      color: @blue;
      font-weight: bold;
      min-width: 24px;
    }

    /* Font sizes */
    #pulseaudio,
    #window,
    #language {
      font-size: 12px;
    }

    #custom-power,
    #custom-inhibitor,
    #custom-nixos {
      font-size: 18px;
      padding-left: 10px;
    }

    /* State variations */
    #custom-inhibitor.on,
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

    #custom-inhibitor:hover,
    #custom-power:hover {
      color: @red-hover;
    }

    /* Workspaces */
    #workspaces {
      padding: 2px 14px;
      margin: 4px;
      background: @bg-primary;
      border-radius: 24px;
    }

    #workspaces button {
      padding: 8px 7px;
      margin: 4px;
      border-radius: 24px;
      color: @fg-dark;
      background: transparent;
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    }

    #workspaces button.active {
      transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
      padding: 8px 24px;
      color: @yellow;
      background: @bg-secondary;
    }

    #workspaces button.urgent {
      color: @red;
    }

    #workspaces button:hover {
      color: @cyan;
    }

    /* Hover effects for modules */
    #custom-inhibitor:hover,
    #custom-power:hover,
    #pulseaudio:hover,
    #workspaces button:hover,
    #clock:hover {
      background: @bg-float;
      box-shadow: 0 0 3px @magenta;
    }
''
