{self, ...}: {
  flake.modules.homeManager.SuperProductivity = {
    pkgs,
    config,
    ...
  }: {
    imports = with self.modules.homeManager; [
      SyncthingKawid
    ];

    home.packages = with pkgs; [
      super-productivity
    ];

    services.syncthing = {
      enable = true;
      settings.folders = {
        tasks = {
          enable = true;
          lable = "Tasks";
          path = "${config.home.homeDirectory}/Documents/Tasks";
          devices = ["phone"];
        };
      };
    };
  };
}
