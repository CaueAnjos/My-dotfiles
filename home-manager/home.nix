{pkgs, ...}: {
  imports = [
    ./git
    ./wezterm
    ./shell
    ./tmux
    ./bat
    ./eza
    ./fzf
    ./yazi
    ./devtools.nix
  ];

  home = rec {
    username = "kawid";
    homeDirectory = "/home/${username}";

    stateVersion = "25.05";

    packages = with pkgs; [
    ];
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
