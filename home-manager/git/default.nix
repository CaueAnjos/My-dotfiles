{
  programs = {
    git = {
      enable = true;
      userName = "CaueAnjos";
      userEmail = "141049846+CaueAnjos@users.noreply.github.com";
      aliases = {
        st = "status -s";
        lg = "log --oneline --graph --decorate";
      };
      includes = [
        {
          contents.init.defaultBranch = "main";
        }
      ];
    };

    gh.enable = true;
    lazygit.enable = true;
  };
}
