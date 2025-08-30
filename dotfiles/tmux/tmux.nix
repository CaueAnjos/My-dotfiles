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
      unbind '"'
      unbind %
      bind-key - split-window -v -c "#{pane_current_path}"
      bind-key \\ split-window -h -c "#{pane_current_path}"
    '';

    plugins = with pkgs.tmuxPlugins; [
      tokyo-night-tmux
    ];
  };
}
