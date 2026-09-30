{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    nautilus
    gnome-clocks
    vlc

    nvd
    nix-output-monitor
  ];

  programs = {
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep 3 --keep-since 3d";
      };
      flake = config.home.homeDirectory + "/My-dotfiles";
    };

    discord.enable = true;
    thunderbird.enable = true;
  };

  services.easyeffects = {
    enable = true;
    extraPresets = {
      dolby-atmos = builtins.fromJSON (builtins.readFile ./easyeffects/dolby-atmos.json);
      male-voice = builtins.fromJSON (builtins.readFile ./easyeffects/male-voice.json);
    };
  };
}
