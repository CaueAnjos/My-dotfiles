{
  imports = [
    ./git
    ./ghostty
    ./obsidian
    ./xremap
    ./syncthing
    ./shell
    ./tmux
    ./bat
    ./eza
    ./fzf
    ./yazi
    ./fastfetch
    ./hyprland
    ./waybar
    ./walker
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
