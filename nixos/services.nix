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
            ads = ["https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts"];
            adult = ["https://blocklistproject.github.io/Lists/porn.txt"];
          };
          clientGroupsBlock = {
            default = ["ads" "adult"];
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

  networking.nameservers = ["127.0.0.1"];
}
