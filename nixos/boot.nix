{pkgs, ...}: {
  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        theme = "${pkgs.sleek-grub-theme.override {
          withBanner = "Windows today?";
          withStyle = "bigSur";
        }}";
        gfxmodeEfi = "1920x1080,1280x1024,auto";
        splashImage = null;
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
      };
      timeout = 0;
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    plymouth = {
      enable = true;
      theme = "colorful_loop";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["colorful_loop"];
        })
      ];
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
