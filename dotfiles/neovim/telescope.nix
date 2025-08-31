pkgs: {
  enable = true;
  extensions = [
    {
      name = "notify";
      packages = [pkgs.vimPlugins.nvim-notify];
    }
  ];
}
