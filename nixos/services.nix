{pkgs, ...}: {
  services = {
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

    gvfs.enable = true;
    udisks2.enable = true;

    openssh.enable = true;
  };
}
