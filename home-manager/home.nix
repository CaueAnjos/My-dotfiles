{config, ...}: {
  imports = [
    ./basic.nix
    ./btop
    ./colorscheme.nix
    ./devtools.nix
    ./documents
    ./fastfetch
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
