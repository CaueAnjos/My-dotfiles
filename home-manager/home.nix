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

  home = {
    username = "kawid";
    homeDirectory = "/home/kawid";

    stateVersion = "25.05";

    packages = with pkgs; [
      neofetch
    ];
  };

  programs.bash.enable = true;

  programs.home-manager.enable = true;
}
