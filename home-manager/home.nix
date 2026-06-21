{config, ...}: {
  imports = [
    ./basic.nix
    ./bat
    ./btop
    ./colorscheme.nix
    ./devtools.nix
    ./documents
    ./eza
    ./fastfetch
    ./fzf
    ./git
    ./hyprland
    ./neovim
    ./noctalia
    ./obs-studio
    ./obsidian
    ./opencode
    ./productivity
    ./research-tools
    ./shell
    ./syncthing
    ./terminal
    ./xremap
    ./yazi
    ./zellij
  ];

  home = {
    username = "kawid";
    homeDirectory = "/home/${config.home.username}";

    stateVersion = "26.05";
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
