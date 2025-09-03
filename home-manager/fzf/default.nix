{
  programs.fzf = {
    enable = true;
    changeDirWidgetCommand = "fd --type dir --hidden";
    defaultCommand = "fd --type f --hidden";
    defaultOptions = [
      "--height 40%"
      "--border"
    ];
  };
}
