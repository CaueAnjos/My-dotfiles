{self, ...}: let
  basic = {pkgs}:
    with pkgs; [
      fd
      eza
      bat
      fzf
      ripgrep
      btop
      yazi

      tinyxxd
      python3
      gcc
    ];

  essentials = {pkgs}:
    (with pkgs; [
      vim
      wget
      fastfetch

      git
      jj

      inotify-tools
      inotify-info

      nvd
      nix-output-monitor
    ])
    ++ basic {inherit pkgs;};
in {
  perSystem = {pkgs, ...}: {
    packages = {
      essentials = pkgs.buildEnv {
        name = "essentials";
        paths = essentials {inherit pkgs;};
        extraOutputsToInstall = ["man"];
      };
    };
  };

  flake.modules.nixos.Essentials = {pkgs, ...}: {
    environment.systemPackages = essentials {inherit pkgs;};
  };

  flake.modules.homeManager.Essentials = {
    pkgs,
    config,
    ...
  }: {
    imports = [
      self.modules.homeManager.VCSKawid
    ];

    home.packages =
      (basic {inherit pkgs;})
      ++ (with pkgs; [
        nautilus
        gnome-clocks
        vlc

        libreoffice
        zotero

        nvd
        nix-output-monitor
      ]);

    programs = {
      fzf.enable = true;

      zoxide = {
        enable = true;
        # Used to replace `cd`
        options = ["--cmd cd"];
      };

      discord.enable = true;
      thunderbird.enable = true;

      nh = {
        enable = true;
        clean = {
          enable = true;
          dates = "weekly";
          extraArgs = "--keep 3 --keep-since 3d";
        };
        # Repo name
        flake = config.home.homeDirectory + "/My-dotfiles";
      };
    };
  };
}
