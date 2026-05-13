{
  imports = [
    ./bat
    ./btop
    ./colorscheme.nix
    ./devtools.nix
    ./eza
    ./fastfetch
    ./fzf
    ./ghostty
    ./git
    ./hyprland
    ./neovim
    ./obs-studio
    ./obsidian
    ./opencode
    ./shell
    ./syncthing
    ./walker
    ./waybar
    ./xremap
    ./yazi
    ./zellij
  ];

  home = rec {
    username = "kawid";
    homeDirectory = "/home/${username}";

    stateVersion = "26.05";
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
