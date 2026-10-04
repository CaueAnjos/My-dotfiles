{
  flake.modules.homeManager.EasyeffectsKawid = {
    services.easyeffects = {
      enable = true;
      extraPresets = {
        dolby-atmos = builtins.fromJSON (builtins.readFile ./dolby-atmos.json);
        male-voice = builtins.fromJSON (builtins.readFile ./male-voice.json);
      };
    };
  };
}
