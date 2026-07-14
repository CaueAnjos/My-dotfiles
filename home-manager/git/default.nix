let
  user = {
    name = "CaueAnjos";
    email = "141049846+CaueAnjos@users.noreply.github.com";
  };
in {
  programs = {
    git = {
      enable = true;
      settings = {inherit user;};
      includes = [
        {
          contents.init.defaultBranch = "main";
        }
      ];
    };

    jujutsu = {
      enable = true;
      settings = {
        inherit user;
        ui.default-command = "log";
      };
    };

    gh.enable = true;
    lazygit.enable = true;
  };
}
