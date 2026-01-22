{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    ripgrep
    bc
    tinyxxd

    inputs.self.packages.${pkgs.system}.neovim
  ];

  home.shellAliases = {
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
