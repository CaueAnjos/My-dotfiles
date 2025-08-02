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

  programs.zsh = {
    enable = true;

    antidote = {
      enable = true;
      plugins = [
        "mattmc3/ez-compinit"
        "zsh-users/zsh-completions"
        "aloxaf/fzf-tab"
        "zsh-users/zsh-autosuggestions"
        "zdharma-continuum/fast-syntax-highlighting"
        "zsh-users/zsh-history-substring-search"
      ];
    };

    defaultKeymap = "viins";
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
