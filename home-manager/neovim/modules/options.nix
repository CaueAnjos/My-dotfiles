{pkgs, ...}: {
  programs.nvf.settings.vim = {
    extraPackages = with pkgs; [
      wl-clipboard
    ];

    options = {
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
      expandtab = true;
      autoindent = false;
      ignorecase = true;
      smartcase = true;
    };

    globals = {
      have_nerd_font = true;
    };
  };
}
