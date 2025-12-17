{
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
      extraGroups = ["wheel" "input" "uinput"]; # Enable ‘sudo’ for the user.
    };
  };
}
