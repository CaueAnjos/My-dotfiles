{pkgs, ...}: {
  boot.kernelModules = ["uinput"];

  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput"
    KERNEL=="event*", SUBSYSTEM=="input", MODE="0660", GROUP="input"
  '';
  users = {
    groups.uinput = {};
    groups.input = {};
    users.kawid = {
      isNormalUser = true;
      extraGroups = [
        "wheel" # Enable ‘sudo’ for the user.
        "input"
        "uinput"
        "podman"
      ];
      shell = pkgs.zsh;
    };
  };

  programs.zsh.enable = true;
}
