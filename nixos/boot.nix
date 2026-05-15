{
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        gfxmodeEfi = "1920x1080,1280x1024,auto";
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
      timeout = -1;
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    plymouth = {
      enable = true;
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];
  };
}
