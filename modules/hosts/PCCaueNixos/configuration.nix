{
  self,
  inputs,
  ...
}: {
  flake.modules.nixos.PCCaueNixosConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    boot = {
      binfmt.emulatedSystems = [
        "aarch64-linux"
        "x86_64-windows"
      ];

      kernelModules = ["uinput"];

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

    virtualisation = {
      containers.enable = true;
      podman = {
        enable = true;
        dockerCompat = true;
        defaultNetwork.settings.dns_enabled = true;
      };
    };

    services.udev.extraRules = ''
      KERNEL=="uinput", MODE="0660", GROUP="uinput"
      KERNEL=="event*", SUBSYSTEM=="input", MODE="0660", GROUP="input"
    '';

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.kawid.imports = [self.modules.homeManager.kawid];
      backupFileExtension = "backup";
    };

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
          "i2c"
        ];
        shell = lib.getExe pkgs.fish;
      };
    };

    time.timeZone = "America/Sao_Paulo";
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocales = ["pt_BR.UTF-8/UTF-8"];

    programs = {
      nano.enable = false;
      nix-ld.enable = true;
      firefox.enable = true;
      hyprland.enable = true;

      # HACK: this shouldn't be here at all
      steam = {
        enable = true;
        extest.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ];
      };
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    programs.hyprland.withUWSM = true;

    services = {
      xserver = {
        enable = true;
        xkb = {
          layout = "br";
          variant = "abnt2";
          options = "nodeadkeys";
        };
      };

      displayManager = {
        sddm = {
          enable = true;
          wayland.enable = true;
          theme = "${pkgs.sddm-astronaut}/share/sddm/themes/sddm-astronaut-theme";
          extraPackages = with pkgs; [
            sddm-astronaut
          ];
        };
      };

      pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
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

      blocky = {
        enable = true;
        settings = {
          ports.dns = 53;
          upstreams.groups.default = [
            "https://one.one.one.one/dns-query"
          ];

          bootstrapDns = {
            upstream = "https://one.one.one.one/dns-query";
            ips = ["1.1.1.1" "1.0.0.1"];
          };

          blocking = {
            denylists = {
              ads = [
                "https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"
                "https://blocklistproject.github.io/Lists/ads.txt"
              ];
              adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
              malware = [
                "https://blocklistproject.github.io/Lists/malware.txt"
                "https://blocklistproject.github.io/Lists/ransomware.txt"
                "https://blocklistproject.github.io/Lists/piracy.txt"
                "https://blocklistproject.github.io/Lists/redirect.txt"
                "https://blocklistproject.github.io/Lists/fraud.txt"
                "https://blocklistproject.github.io/Lists/basic.txt"
              ];
              phishing = [
                "https://blocklistproject.github.io/Lists/phishing.txt"
              ];
            };
            clientGroupsBlock = {
              default = ["ads" "adult" "malware" "phishing"];
            };
          };

          caching = {
            minTime = "5m";
            maxTime = "30m";
            prefetching = true;
          };
        };
      };
    };

    networking = {
      hostName = "PCCaueNixos";
      networkmanager.enable = true;
      enableIPv6 = false;
      firewall.enable = false;

      nameservers = ["127.0.0.1"];
    };

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "25.11"; # Did you read the comment?
  };
}
