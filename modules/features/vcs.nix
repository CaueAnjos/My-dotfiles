{inputs, ...}: let
  inherit (inputs.wrapper-modules) wrappers;

  user = {
    name = "CaueAnjos";
    email = "141049846+CaueAnjos@users.noreply.github.com";
  };
in {
  perSystem = {config, ...}: {
    packages = {
      jj-kawid = wrappers.jujutsu.wrap {
        settings = {
          inherit user;
          ui.default-command = "log";
        };
      };

      git-kawid = wrappers.git.wrap {
        settings = {
          inherit user;
          init.defaultBranch = "main";
        };
      };
    };

    overlayAttrs = {
      inherit (config.packages) jj-kawid git-kawid;
    };
  };

  flake.modules.homeManager.KawidVCS = {pkgs, ...}: {
    home.packages = with pkgs; [
      jj-kawid
      git-kawid
      gh
    ];
  };
}
