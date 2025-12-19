{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    printing.enable = true;

    openssh.enable = true;
  };
}
