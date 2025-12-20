{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.ghostty = {
    enable = true;
    settings = {
      font-size = 13;
      cursor-style = "block";
      mouse-hide-while-typing = true;
      background-opacity = 0.7;
      quit-after-last-window-closed = false;
    };
  };
}
