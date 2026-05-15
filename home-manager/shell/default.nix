{
  home.shellAliases = {
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
  programs.starship = {
    enable = true;

    settings = {
      format = ''
        $directory$git_branch$git_status$nix_shell
        $character
      '';
    };
  };
}
