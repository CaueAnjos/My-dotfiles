{inputs, ...}: let
  inherit (inputs.wrapper-modules) wrappers;

  starship-kawid.settings = {
    format = ''
      $directory$git_branch$git_status$nix_shell
      $character
    '';
  };

  kitty-kawid.settings = {
    cursor_shape = "block";
    cursor_trail = 1;
  };
in {
  perSystem = {
    pkgs,
    config,
    ...
  }: {
    packages = {
      kitty-kawid = wrappers.kitty.wrap {
        inherit pkgs;
        inherit (kitty-kawid) settings;
      };

      starship-kawid = wrappers.starship.wrap {
        inherit pkgs;
        inherit (starship-kawid) settings;
      };
    };

    overlayAttrs = {
      inherit (config.packages) kitty-kawid;
    };
  };

  flake.modules.homeManager.Terminal = {
    home.shell.enableFishIntegration = true;
    xdg.terminal-exec = {
      enable = true;
      settings.default = ["kitty"];
    };

    programs = {
      fish = {
        enable = true;
        functions = {
          "fish_greeting".body = "";
        };
      };

      starship = {
        enable = true;
        inherit (starship-kawid) settings;
      };

      kitty = {
        enable = true;
        inherit (kitty-kawid) settings;
      };
    };
  };
}
