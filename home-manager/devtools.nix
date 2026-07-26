{pkgs, ...}: let
  user = {
    name = "CaueAnjos";
    email = "141049846+CaueAnjos@users.noreply.github.com";
  };
in {
  home.packages = with pkgs; [
    ripgrep
    bc
    tinyxxd
  ];

  home.shellAliases = {
    ls = "eza";
    cat = "bat";
    cd = "z";
  };

  programs = {
    fd = {
      enable = true;
      hidden = true;
    };

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

    fzf = {
      enable = true;
      changeDirWidgetCommand = "fd --type dir";
      defaultCommand = "fd --type f";
      defaultOptions = [
        "--height 60%"
        "--border"
      ];
    };

    eza = {
      enable = true;
      colors = "always";
      icons = "always";
      git = true;
    };

    zoxide.enable = true;

    bat.enable = true;

    devenv.enable = true;

    direnv = {
      enable = true;
      silent = true;
      nix-direnv.enable = true;
    };
  };
}
