{pkgs, ...}: {
  programs.bat = let
    tokyonightTheme = pkgs.fetchFromGitHub {
      owner = "folke";
      repo = "tokyonight.nvim";
      rev = "057ef5d260c1931f1dffd0f052c685dcd14100a3";
      sha256 = "1xZhQR1BhH2eqax0swlNtnPWIEUTxSOab6sQ3Fv9WQA=";
    };
  in {
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
}
