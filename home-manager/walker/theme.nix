palette:
/*
css
*/
''
  /* Tokyo Night Theme for Walker App Launcher */
  /* Based on base16-tokyonight color scheme */

  /* Base16 Tokyo Night Color Palette */
  @define-color base00 #${palette.base00}; /* Default Background */
  @define-color base01 #${palette.base01}; /* Lighter Background */
  @define-color base02 #${palette.base02}; /* Selection Background */
  @define-color base03 #${palette.base03}; /* Comments, Invisibles */
  @define-color base04 #${palette.base04}; /* Dark Foreground */
  @define-color base05 #${palette.base05}; /* Default Foreground */
  @define-color base06 #${palette.base06}; /* Light Foreground */
  @define-color base07 #${palette.base07}; /* Light Background */
  @define-color base08 #${palette.base08}; /* Red/Variables */
  @define-color base09 #${palette.base09}; /* Orange/Integers */
  @define-color base0A #${palette.base0A}; /* Yellow/Classes */
  @define-color base0B #${palette.base0B}; /* Green/Strings */
  @define-color base0C #${palette.base0C}; /* Cyan/Support */
  @define-color base0D #${palette.base0D}; /* Blue/Functions */
  @define-color base0E #${palette.base0E}; /* Purple/Keywords */
  @define-color base0F #${palette.base0F}; /* Magenta/Deprecated */

  /* Theme color mappings */
  @define-color window_bg_color @base00;
  @define-color accent_bg_color @base0D;
  @define-color accent_purple @base0E;
  @define-color theme_fg_color @base05;
  @define-color error_bg_color @base08;
  @define-color error_fg_color @base07;
  @define-color highlight_color @base0C;
  @define-color success_color @base0B;

  /* Reset all styles */
  * {
    all: unset;
  }

  /* Window wrapper */
  .box-wrapper {
    box-shadow:
      0 20px 40px rgba(0, 0, 0, 0.5),
      0 16px 16px rgba(0, 0, 0, 0.3),
      0 0 0 1px alpha(@base0D, 0.1);
    background: linear-gradient(135deg, @base00 0%, darker(@base00) 100%);
    padding: 24px;
    border-radius: 16px;
    border: 1px solid alpha(@base0D, 0.3);
  }

  /* Input field */
  .input {
    caret-color: @base0D;
    background: linear-gradient(to bottom, @base01, darker(@base01));
    padding: 14px 16px;
    color: @theme_fg_color;
    border-radius: 12px;
    border: 1px solid alpha(@base02, 0.5);
    transition: all 200ms ease;
    box-shadow:
      inset 0 1px 3px rgba(0, 0, 0, 0.3),
      0 0 0 0 alpha(@base0D, 0);
  }

  .input:focus {
    border-color: alpha(@base0D, 0.6);
    box-shadow:
      inset 0 1px 3px rgba(0, 0, 0, 0.3),
      0 0 0 3px alpha(@base0D, 0.15);
  }

  .input placeholder {
    opacity: 0.5;
    color: @base04;
  }

  /* List items */
  .list {
    color: @theme_fg_color;
  }

  .item-box {
    border-radius: 10px;
    padding: 12px 14px;
    transition: all 150ms ease;
    border: 1px solid transparent;
  }

  child:hover .item-box {
    background: linear-gradient(
      90deg,
      alpha(@accent_purple, 0.15),
      alpha(@accent_bg_color, 0.15)
    );
    border-color: alpha(@base0D, 0.2);
    transform: translateX(2px);
  }

  child:selected .item-box {
    background: linear-gradient(
      90deg,
      alpha(@accent_purple, 0.25),
      alpha(@accent_bg_color, 0.25)
    );
    border-color: alpha(@base0D, 0.4);
    box-shadow:
      0 2px 8px alpha(@base0D, 0.2),
      inset 0 0 0 1px alpha(@base0D, 0.1);
  }

  .item-text {
    font-size: 14px;
    font-weight: 500;
    color: @base06;
  }

  child:selected .item-text {
    color: @base07;
  }

  .item-subtext {
    font-size: 12px;
    opacity: 0.6;
    color: @base04;
  }

  child:selected .item-subtext {
    opacity: 0.8;
    color: @base05;
  }

  .item-image,
  .item-image-text {
    margin-right: 12px;
  }

  /* Quick activation labels */
  .item-quick-activation {
    margin-left: 12px;
    background: linear-gradient(135deg, alpha(@base0E, 0.3), alpha(@base0D, 0.3));
    border: 1px solid alpha(@base0E, 0.4);
    border-radius: 6px;
    padding: 4px 10px;
    font-size: 11px;
    font-weight: 600;
    color: @base0E;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }

  child:selected .item-quick-activation {
    background: linear-gradient(135deg, alpha(@base0E, 0.5), alpha(@base0D, 0.5));
    border-color: alpha(@base0E, 0.6);
    color: @base07;
  }

  /* Placeholders */
  .placeholder,
  .elephant-hint {
    color: @base04;
    opacity: 0.7;
  }

  /* Keybinds display */
  .keybinds-wrapper {
    border-top: 1px solid alpha(@base02, 0.5);
    margin-top: 12px;
    padding-top: 12px;
    font-size: 11px;
    opacity: 0.6;
    color: @base04;
  }

  .keybind-bind {
    font-weight: 700;
    text-transform: lowercase;
    color: @base0D;
    background: alpha(@base0D, 0.15);
    padding: 2px 6px;
    border-radius: 4px;
    border: 1px solid alpha(@base0D, 0.3);
  }

  /* Error display */
  .error {
    padding: 12px 14px;
    background: linear-gradient(135deg, @error_bg_color, darker(@error_bg_color));
    color: @error_fg_color;
    border-radius: 8px;
    border: 1px solid lighter(@error_bg_color);
    box-shadow: 0 4px 12px alpha(@error_bg_color, 0.3);
    font-weight: 500;
  }

  /* Preview pane */
  .preview {
    border: 1px solid alpha(@base0D, 0.3);
    padding: 14px;
    border-radius: 12px;
    color: @theme_fg_color;
    background: alpha(@base01, 0.5);
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.2);
  }

  /* Icon sizes */
  .normal-icons {
    -gtk-icon-size: 18px;
  }

  .large-icons {
    -gtk-icon-size: 36px;
  }

  /* Hide scrollbar */
  scrollbar {
    opacity: 0;
  }

  /* Optional: Scrollbar styling if you want to show it */
  scrollbar slider {
    background: alpha(@base0D, 0.3);
    border-radius: 8px;
    min-width: 6px;
    min-height: 6px;
  }

  scrollbar slider:hover {
    background: alpha(@base0D, 0.5);
  }

  /* Separator styling */
  separator {
    background: alpha(@base02, 0.3);
    min-height: 1px;
  }
''
