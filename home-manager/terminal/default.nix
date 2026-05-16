{
  xdg.terminal-exec = {
    enable = true;
    settings.default = ["kitty"];
  };

  programs.kitty = {
    enable = true;
    settings = {
      cursor_shape = "block";
      cursor_trail = 1;
    };
  };
}
