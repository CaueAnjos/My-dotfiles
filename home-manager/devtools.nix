{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    clipboard-jh
    docker
  ];

  home.shellAliases = {
    dev = "nix develop --command zsh";
    # FIXME: this should be done in the right fast-syntax-highlighting
    nvim = "nix run ~/.config/home-manager#neovim --";
  };

  programs = {
    direnv.enable = true;
    zoxide.enable = true;
    fd = {
      enable = true;
      hidden = true;
    };
  };
}
