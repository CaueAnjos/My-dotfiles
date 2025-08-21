{ config, ... }:
{
  home.shellAliases = {
    hs = "home-manager switch";
    hgc = "nix-collect-garbage -d";
    ls = "eza";
    la = "eza -A";
    cat = "bat";
    cd = "z";
  };

  home.shell.enableZshIntegration = true;

  home.file."scripts/".source = ./dotfiles/scripts;

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";

    antidote = {
      enable = true;
      plugins = [
        "mattmc3/ez-compinit"
        "zsh-users/zsh-completions"
        "aloxaf/fzf-tab"
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting"
        "zsh-users/zsh-history-substring-search"
        "jeffreytse/zsh-vi-mode"
      ];
    };
    initContent = ''
      function zvm_after_lazy_keybindings() {
          zvm_bindkey vicmd '^p' history-substring-search-down
          zvm_bindkey vicmd '^n' history-substring-search-up
      }
    '';

    history = {
      append = true;
      ignoreDups = true;
      saveNoDups = true;
      share = true;
    };
  };

  programs.oh-my-posh = {
    enable = true;
    useTheme = "tokyonight_storm";
  };
}
