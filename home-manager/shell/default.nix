{
  home.shellAliases = {
    hs = "home-manager switch";
    hgc = "nix-collect-garbage -d";
    ls = "eza";
    la = "eza -A";
    cat = "bat";
    cd = "z";
  };

  home.shell.enableFishIntegration = true;
  programs.fish = {
    enable = true;
    functions = {
      "fish_greeting".body = "";
    };
  };
  programs.oh-my-posh = {
    enable = true;
    configFile = ./tokyo_modded.json;
  };
}
