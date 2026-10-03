let
  essentials = {pkgs}:
    with pkgs; [
      # TODO: add Neovim here
      vim
      wget
      fastfetch

      fd
      eza
      bat
      fzf
      ripgrep

      tinyxxd
      git
      jj
      python3
      gcc

      inotify-tools
      inotify-info

      nvd
      nix-output-monitor
    ];
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
}
