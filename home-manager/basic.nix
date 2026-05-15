{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    gnome-clocks
    vlc
  ];

  programs.discord.enable = true;
  programs.thunderbird.enable = true;
  services.easyeffects.enable = true;
}
