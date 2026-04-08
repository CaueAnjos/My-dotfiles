{
  imports = [
    ./git
    ./ghostty
    ./obsidian
    ./opencode
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
    ./btop
    ./colorscheme.nix
  ];

  home = rec {
    username = "kawid";
    homeDirectory = "/home/${username}";

    stateVersion = "26.05";
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
