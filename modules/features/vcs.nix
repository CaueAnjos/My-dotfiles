{inputs, ...}: let
  inherit (inputs.wrapper-modules) wrappers;

  user = {
    name = "CaueAnjos";
    email = "141049846+CaueAnjos@users.noreply.github.com";
  };

  jj-kawid.settings = {
    inherit user;
    ui.default-command = "log";
  };

  git-kawid.settings = {
    inherit user;
    init.defaultBranch = "main";
  };
in {
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    packages = {
      jj-kawid = wrappers.jujutsu.wrap {
        inherit pkgs;
        inherit (jj-kawid) settings;
      };

      git-kawid = wrappers.git.wrap {
        inherit pkgs;
        inherit (git-kawid) settings;
      };
    };

    overlayAttrs = {
      inherit (config.packages) jj-kawid git-kawid;
    };
  };

  flake.modules.homeManager.VCSKawid = {
    programs = {
      jujutsu = {
        enable = true;
        inherit (jj-kawid) settings;
      };

      git = {
        enable = true;
        inherit (git-kawid) settings;
      };

      gh = {
        enable = true;
        gitCredentialHelper.enable = true;
      };
    };
  };
}
