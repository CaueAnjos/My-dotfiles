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
      # compilers and essential tools
      gcc
      glibc
      dotnetCorePackages.sdk_8_0-bin
      cargo
      unzip
      python314

      # for nix
      nixfmt-rfc-style

      neofetch
    ];
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
