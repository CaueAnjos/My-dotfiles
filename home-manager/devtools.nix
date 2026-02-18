{pkgs, ...}: {
  home.packages = with pkgs; [
    ripgrep
    bc
    tinyxxd
    ddcutil
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
