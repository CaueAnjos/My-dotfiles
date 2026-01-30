{config, ...}: let
  inherit (config.colorScheme) palette;

  # Helper function to convert hex color to RGB list
  hexToRgb = hex: let
    r = builtins.substring 0 2 hex;
    g = builtins.substring 2 2 hex;
    b = builtins.substring 4 2 hex;
    toInt = x: builtins.fromTOML "v=0x${x}";
  in [(toInt r).v (toInt g).v (toInt b).v];

  # Convert palette colors to RGB
  rgb = builtins.mapAttrs (name: value: hexToRgb value) palette;
in {
  programs.zellij = {
    enable = true;

    settings = {
      simplified_ui = true;
      pane_frames = false;
      show_startup_tips = false;
      theme = "base16";

      themes.base16 = {
        # Unselected text (status bar text, etc)
        text_unselected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected text (highlighted search results, etc)
        text_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected ribbon (inactive tabs, keybinding modes)
        ribbon_unselected = {
          base = rgb.base03;
          background = rgb.base01;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base09;
          emphasis_2 = rgb.base0A;
          emphasis_3 = rgb.base0B;
        };

        # Selected ribbon (active tab, current mode)
        ribbon_selected = {
          base = rgb.base00;
          background = rgb.base0D;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base09;
          emphasis_2 = rgb.base0A;
          emphasis_3 = rgb.base0B;
        };

        # Table title
        table_title = {
          base = rgb.base05;
          background = rgb.base01;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected table cell
        table_cell_unselected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected table cell
        table_cell_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected list item
        list_unselected = {
          base = rgb.base05;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected list item
        list_selected = {
          base = rgb.base05;
          background = rgb.base02;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Unselected frame (non-focused panes)
        frame_unselected = {
          base = rgb.base03;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Selected frame (focused pane)
        frame_selected = {
          base = rgb.base0D;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Highlighted frame (focused pane in special mode)
        frame_highlight = {
          base = rgb.base0A;
          background = rgb.base00;
          emphasis_0 = rgb.base0D;
          emphasis_1 = rgb.base0E;
          emphasis_2 = rgb.base0C;
          emphasis_3 = rgb.base0B;
        };

        # Exit code success indicator
        exit_code_success = {
          base = rgb.base0B;
          background = rgb.base00;
          emphasis_0 = rgb.base0B;
          emphasis_1 = rgb.base0B;
          emphasis_2 = rgb.base0B;
          emphasis_3 = rgb.base0B;
        };

        # Exit code error indicator
        exit_code_error = {
          base = rgb.base08;
          background = rgb.base00;
          emphasis_0 = rgb.base08;
          emphasis_1 = rgb.base08;
          emphasis_2 = rgb.base08;
          emphasis_3 = rgb.base08;
        };

        # Multiplayer user colors
        multiplayer_user_colors = {
          player_1 = rgb.base08;
          player_2 = rgb.base09;
          player_3 = rgb.base0A;
          player_4 = rgb.base0B;
          player_5 = rgb.base0C;
          player_6 = rgb.base0D;
          player_7 = rgb.base0E;
          player_8 = rgb.base0F;
          player_9 = rgb.base03;
          player_10 = rgb.base04;
        };
      };
    };
  };
}
