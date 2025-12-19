{
  networking = {
    hostName = "PCCaueNixos";
    networkmanager.enable = true;
    enableIPv6 = false;
    firewall = {
      enable = false;
      allowedTCPPorts = [
        8384 # NOTE: this opens the ssyncthing GUI port!
      ];
    };
  };
}
