{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.wezterm.enable = true;

  home.file.".config/wezterm".source = ./dotfiles/wezterm;
}
