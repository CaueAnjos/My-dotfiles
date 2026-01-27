{
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

      palettes.tokyo_night = {
        bg = "#1a1b26";
        fg = "#c0caf5";
        blue = "#7aa2f7";
        cyan = "#7dcfff";
        green = "#9ece6a";
        magenta = "#bb9af7";
        orange = "#ff9e64";
        red = "#f7768e";
        yellow = "#e0af68";
        gray = "#565f89";
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
