{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";
    newSession = true;
    keyMode = "vi";
    disableConfirmationPrompt = true;
    customPaneNavigationAndResize = true;
    extraConfig = ''
      bind r source-file ~/.config/tmux/tmux.conf
    '';

    plugins = with pkgs.tmuxPlugins; [
      tokyo-night-tmux
    ];
  };
}
