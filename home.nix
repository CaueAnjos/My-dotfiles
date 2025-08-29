{pkgs, ...}: {
  imports = [
    ./dotfiles/git/git.nix
    ./dotfiles/neovim/neovim.nix
    ./dotfiles/wezterm/wezterm.nix
    ./dotfiles/shell/shell.nix
    ./dotfiles/tmux/tmux.nix

    ./devtools.nix
  ];

  home = {
    username = "kawid";
    homeDirectory = "/home/kawid";

    stateVersion = "25.05";

    packages = with pkgs; [
      dotnet-sdk_9
      neofetch
    ];
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
