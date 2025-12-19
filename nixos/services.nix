{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    openssh.enable = true;

    syncthing = {
      enable = true;
      openDefaultPorts = true;
      settings = {
        gui = {
          user = "kawid";
          password = "0914";
        };
        devices = {
          "CelularCaue" = {id = "R4KBHZE-4PSK5PL-3BZDH2P-25NVAFT-J5LG36W-YJRU6TW-GH3UWPQ-DG7ZMAI";};
        };
      };
    };
  };
}
