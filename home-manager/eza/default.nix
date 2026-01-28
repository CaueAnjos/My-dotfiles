{config, ...}: {
  programs.eza = {
    enable = true;
    colors = "always";
    icons = "always";
    git = true;
    theme = import ./theme.nix config.colorScheme.palette;
  };
}
