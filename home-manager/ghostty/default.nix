{pkgs, ...}: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  programs.ghostty = {
    enable = true;
    enableZshIntegration = false;
    settings = {
      font-size = 15;
      cursor-style = "block";
      cursor-opacity = 0.5;
      mouse-hide-while-typing = true;
      background-opacity = 0.5;
    };
  };
}
