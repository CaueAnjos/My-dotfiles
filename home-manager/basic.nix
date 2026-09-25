{pkgs, ...}: {
  home.packages = with pkgs; [
    nautilus
    gnome-clocks
    vlc
  ];

  programs.discord.enable = true;
  programs.thunderbird.enable = true;
  services.easyeffects = {
    enable = true;
    extraPresets = {
      dolby-atmos = builtins.fromJSON (builtins.readFile ./easyeffects/dolby-atmos.json);
      male-voice = builtins.fromJSON (builtins.readFile ./easyeffects/male-voice.json);
    };
  };
}
