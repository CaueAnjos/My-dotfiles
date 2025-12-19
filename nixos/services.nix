{pkgs, ...}: {
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };

    openssh.enable = true;
  };
}
