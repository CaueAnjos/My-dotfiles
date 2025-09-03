{...}: {
  programs.git = {
    enable = true;
    userName = "CaueAnjos";
    userEmail = "141049846+CaueAnjos@users.noreply.github.com";
    aliases = {
      st = "status -s";
      lg = "log --oneline --graph --decorate";
    };
  };

  programs.gh.enable = true;
  programs.lazygit.enable = true;
}
