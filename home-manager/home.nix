{
  imports = [
    ./git
    ./ghostty
    ./obsidian
    ./xremap
    ./syncthing
    ./shell
    ./zellij
    ./bat
    ./eza
    ./fzf
    ./yazi
    ./fastfetch
    ./hyprland
    ./waybar
    ./walker
    ./neovim
    ./devtools.nix
    ./colorscheme.nix
  ];

  home = rec {
    username = "kawid";
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
