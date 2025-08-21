{ ... }:
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.file.".config/nvim".source = ./dotfiles/nvim;
}
