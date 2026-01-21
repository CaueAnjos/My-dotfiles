{
  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "CaueAnjos";
          email = "141049846+CaueAnjos@users.noreply.github.com";
        };
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
