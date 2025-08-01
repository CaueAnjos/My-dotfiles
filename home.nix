{ config, pkgs, ... }:
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

    #dev tools
    neovim
    fd
    eza
    bat
    ripgrep
    yazi

    neofetch
  ];

  home.shellAliases = {
    ls = "eza --long";
    la = "eza --long -A";
    cat = "bat";
    cd = "z";
  };

  home.shell.enableZshIntegration = true;

  programs.zoxide.enable = true;

  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type dir --hidden";
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };

  programs.zsh.enable = true;
  programs.oh-my-posh = {
    enable = true;
    useTheme = "amro";
  };

  programs.bash.enable = true;

  home.file = {
    ".config/nvim".source = ./dotfiles/nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "zsh";
  };

  programs.home-manager.enable = true;
}
