{pkgs, ...}: {
  # NOTE: uses dropbox for syncing
  home.packages = with pkgs; [
    super-productivity
  ];
}
