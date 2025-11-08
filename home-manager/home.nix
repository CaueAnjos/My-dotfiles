{
  imports = [
    ./git
    ./wezterm
    ./shell
    ./tmux
    ./bat
    ./eza
    ./fzf
    ./yazi
    ./fastfetch
    ./devtools.nix
  ];

  home = rec {
    username = "kawid";
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
