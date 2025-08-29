{pkgs, ...}: {
  imports = [
    ./dotfiles/git/git.nix
    ./dotfiles/neovim/neovim.nix
    ./dotfiles/wezterm/wezterm.nix
    ./dotfiles/shell/shell.nix

    ./devtools.nix
  ];

  home = {
    username = "kawid";
    homeDirectory = "/home/kawid";

    stateVersion = "25.05";

    packages = with pkgs; [
      gcc
      glibc
      dotnet-sdk_9
      cargo
      unzip
      python314

      neofetch
    ];
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
