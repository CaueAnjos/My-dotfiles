{
  home.shellAliases = {
    ls = "eza --long";
    la = "eza --long -A";
    cat = "bat";
    cd = "z";
  };

  home.shell.enableZshIntegration = true;

  programs.zsh.enable = true;
  programs.oh-my-posh = {
    enable = true;
    useTheme = "tokyonight_storm";
  };
}
