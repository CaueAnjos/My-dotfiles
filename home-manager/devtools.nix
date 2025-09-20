{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    clipboard-jh
    docker
    tinyxxd

    inputs.self.packages.${pkgs.system}.neovim
  ];

  home.shellAliases = {
    dev = "nix develop --command zsh";
    hex = "tinyxxd";
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
