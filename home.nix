{ pkgs, ... }:
{
  home.username = "kawid";
  home.homeDirectory = "/home/kawid";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    # compilers and essential tools
    gcc
    glibc
    dotnetCorePackages.sdk_8_0_3xx-bin
    cargo
    unzip
    python314

    # for nix
    nixfmt-rfc-style

    neofetch
  ];

  programs.bash.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
