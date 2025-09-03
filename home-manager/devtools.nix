{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    clipboard-jh
    docker

    inputs.self.packages.${pkgs.system}.neovim
  ];

  home.shellAliases = {
    dev = "nix develop --command zsh";
  };

  programs = {
    direnv.enable = true;
    zoxide.enable = true;
    fd = {
      enable = true;
      hidden = true;
    };
  };
}
