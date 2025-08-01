{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
    ripgrep
  ];

  home.file.".config/nvim".source = ./dotfiles/nvim;

  programs.bat =
    let
      tokyonightTheme = pkgs.fetchFromGitHub {
        owner = "folke";
        repo = "tokyonight.nvim";
        rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
        sha256 = "1xZhQR1BhH2eqax0swlNtnPWIEUTxSOab6sQ3Fv9WQA=";
      };
    in
    {
      enable = true;
      themes = {
        tokyonight_night = {
          src = tokyonightTheme;
          file = "extras/sublime/tokyonight_night.tmTheme";
        };
      };
      config = {
        theme = "tokyonight_night";
      };
    };

  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
  };
  home.file.".config/eza/theme.yml".source = ./dotfiles/eza/tokyonight.yml;

  programs.zoxide.enable = true;

  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type dir --hidden";
    defaultCommand = "fd --type f";
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };

  programs.fd = {
    enable = true;
    hidden = true;
  };

  programs.yazi = {
    enable = true;
    shellWrapperName = "y";
  };
}
