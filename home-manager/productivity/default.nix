{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    super-productivity
  ];

  services.syncthing = {
    settings = {
      folders = {
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
