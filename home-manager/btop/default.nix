{config, ...}: let
  inherit (config.colorScheme) palette;
in {
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "base16";
      theme_background = false;
    };
    themes = {
      base16 = ''
        theme[main_bg]="#${palette.base00}"
        theme[main_fg]="#${palette.base05}"
        theme[title]="#${palette.base05}"
        theme[hi_fg]="#${palette.base03}"
        theme[selected_bg]="#${palette.base0E}"
        theme[selected_fg]="#${palette.base05}"
        theme[inactive_fg]="#${palette.base03}"
        theme[graph_text]="#${palette.base05}"
        theme[meter_bg]="#${palette.base03}"
        theme[proc_misc]="#${palette.base0D}"
        theme[cpu_box]="#${palette.base0D}"
        theme[mem_box]="#${palette.base0B}"
        theme[net_box]="#${palette.base08}"
        theme[proc_box]="#${palette.base0C}"
        theme[div_line]="#${palette.base03}"
        theme[temp_start]="#${palette.base0D}"
        theme[temp_mid]="#${palette.base0E}"
        theme[temp_end]="#${palette.base0F}"
        theme[cpu_start]="#${palette.base0D}"
        theme[cpu_mid]="#${palette.base0C}"
        theme[cpu_end]="#${palette.base0B}"
        theme[free_start]="#${palette.base0E}"
        theme[free_mid]="#${palette.base0E}"
        theme[free_end]="#${palette.base0F}"
        theme[cached_start]="#${palette.base0C}"
        theme[cached_mid]="#${palette.base0C}"
        theme[cached_end]="#${palette.base0C}"
        theme[available_start]="#${palette.base0A}"
        theme[available_mid]="#${palette.base0A}"
        theme[available_end]="#${palette.base09}"
        theme[used_start]="#${palette.base0B}"
        theme[used_mid]="#${palette.base0B}"
        theme[used_end]="#${palette.base0B}"
        theme[download_start]="#${palette.base0D}"
        theme[download_mid]="#${palette.base0B}"
        theme[download_end]="#${palette.base0C}"
        theme[upload_start]="#${palette.base0E}"
        theme[upload_mid]="#${palette.base0E}"
        theme[upload_end]="#${palette.base0F}"
        theme[process_start]="#${palette.base0B}"
        theme[process_mid]="#${palette.base0C}"
        theme[process_end]="#${palette.base03}"
      '';
    };
  };
}
