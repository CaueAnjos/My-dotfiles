{
  self,
  inputs,
  ...
}: let
  inherit (inputs) home-manager;
in {
  imports = [
    home-manager.flakeModules.home-manager
  ];

  flake.modules.homeManager.kawid = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.modules.homeManager; [
      EasyeffectsKawid
      Essentials
      HyprlandKawid
      NeovimKawid
      NoctaliaKawid
      OpencodeKawid
      SuperProductivity
      SyncthingKawid
      Terminal
      ThemedStylix
      XRemapKawid
      ZellijKawid
    ];

    home = {
      username = "kawid";
      homeDirectory = "/home/${config.home.username}";

      shellAliases = {
        ls = "eza";
        cat = "bat";
      };

      stateVersion = "26.05";
    };

    programs = {
      devenv.enable = true;

      direnv = {
        enable = true;
        silent = true;
        nix-direnv.enable = true;
      };

      bash.enable = true;

      home-manager.enable = true;

      obsidian.enable = true;

      obs-studio = {
        enable = true;
        plugins = with pkgs.obs-studio-plugins; [
          droidcam-obs
        ];
      };
    };
  };

  flake.homeConfigurations.kawid = home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [self.modules.homeManager.kawid];
  };
}
