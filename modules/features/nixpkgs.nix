{self, ...}: {
  flake.modules.nixos.NixpkgsConfiguration = {pkgs, ...}: {
    nix = {
      package = pkgs.lixPackageSets.stable.lix;

      # should add a file (/etc/nix/nix-access-tokens) with:
      #   access-tokens = akjkajkfjalfj
      extraOptions = ''
        !include /etc/nix/nix-access-tokens
      '';
      settings = {
        experimental-features = ["nix-command" "flakes"];
        trusted-users = ["@wheel"];
        extra-substituters = [
          "https://hyprland.cachix.org"
          "https://noctalia.cachix.org"
        ];
        extra-trusted-public-keys = [
          "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };
    };

    nixpkgs = {
      # lix configuration
      overlays = [
        (_: prev: {
          inherit
            (prev.lixPackageSets.stable)
            nixpkgs-review
            nix-eval-jobs
            nix-fast-build
            colmena
            ;
        })

        self.overlays.default
      ];

      config.allowUnfree = true;
    };
  };
}
