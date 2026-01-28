{config, ...}: {
  home.shellAliases = {
    ls = "eza";
    la = "eza -A";
    cat = "bat";
    cd = "z";
  };

  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    functions = {
      "fish_greeting".body = "";
    };
  };
  programs.starship = {
    enable = true;

    settings = {
      # Use a custom palette
      palette = "tokyo_night";

      palettes.tokyo_night = let
        inherit (config.colorScheme) palette;
      in {
        bg = "#${palette.base00}";
        fg = "#${palette.base05}";
        blue = "#${palette.base0D}";
        cyan = "#${palette.base0C}";
        green = "#${palette.base0B}";
        magenta = "#${palette.base0E}";
        orange = "#${palette.base09}";
        red = "#${palette.base08}";
        yellow = "#${palette.base0A}";
        gray = "#${palette.base03}";
      };

      format = ''
        $directory$git_branch$git_status$nix_shell
        $character
      '';

      directory = {
        style = "fg:blue";
      };

      nix_shell = {
        style = "fg:magenta";
        symbol = " ";
      };

      git_branch = {
        style = "fg:yellow";
        symbol = " ";
      };

      git_status = {
        style = "fg:orange";
      };

      character = {
        success_symbol = "[❯](green)";
        error_symbol = "[❯](red)";
      };
    };
  };
}
