{pkgs, ...}: {
  home.packages = with pkgs; [
    super-productivity
  ];

  services.syncthing = {
    settings = {
      folders = {
        tasks = {
          enable = true;
          lable = "Tasks";
          path = "/home/kawid/Documents/Tasks";
          devices = ["phone"];
        };
      };
    };
  };
}
